#!/usr/bin/env python3
import os, pty, fcntl, termios, struct, select, sys, signal

COLS = int(os.environ.get('TERM_COLS', '150'))
ROWS = int(os.environ.get('TERM_ROWS', '42'))

master, slave = pty.openpty()
fcntl.ioctl(slave, termios.TIOCSWINSZ, struct.pack('HHHH', ROWS, COLS, 0, 0))

pid = os.fork()
if pid == 0:
    os.setsid()
    fcntl.ioctl(slave, termios.TIOCSCTTY, 0)
    for fd in (0, 1, 2):
        os.dup2(slave, fd)
    os.close(master)
    os.close(slave)
    env = dict(os.environ)
    env.update(TERM='xterm-256color', COLORTERM='truecolor', COLUMNS=str(COLS), LINES=str(ROWS))
    os.chdir(os.environ.get('TERM_CWD', os.getcwd()))
    args = ['opencode'] + [a for a in os.environ.get('TERM_ARGS', '').split(' ') if a]
    os.execvpe('opencode', args, env)

os.close(slave)
try:
    while True:
        r, _, _ = select.select([0, master], [], [])
        if 0 in r:
            data = os.read(0, 65536)
            if not data:
                break
            os.write(master, data)
        if master in r:
            try:
                data = os.read(master, 65536)
            except OSError:
                break
            if not data:
                break
            os.write(1, data)
finally:
    try:
        os.kill(pid, signal.SIGTERM)
    except OSError:
        pass
