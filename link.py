import os
import sys
import subprocess

home_dir = os.path.expanduser('~')
dotfiles_dir = os.path.join(home_dir, '.env', 'dotfiles')
symlinks_dir = os.path.join(dotfiles_dir, 'symlinks')

def run_sub(args, env=None, cwd=None, show_logs=True):
    lines = []
    p = subprocess.Popen(args,
                         env=env,
                         cwd=cwd,
                         stdout=subprocess.PIPE,
                         universal_newlines=True,
                         encoding='utf-8')
    if show_logs:
        sys.stdout.flush()
        for stdout_line in iter(p.stdout.readline, ""):
            lines.append(stdout_line.split(sep='\n')[0])
            sys.stdout.write(stdout_line)
            sys.stdout.flush()
    out = p.stdout
    p.stdout.close()
    return_code = p.wait()
    if return_code:
        raise subprocess.CalledProcessError(return_code, args)
    return lines

lines = run_sub(['find', symlinks_dir], cwd=home_dir, env=os.environ)
for line in lines:
    if line == symlinks_dir:
        continue
    try:
        run_sub([
            'ln', '-s', line, os.path.join(home_dir, line.split(sep='/')[-1])
        ], cwd=home_dir, env=os.environ)
    except subprocess.CalledProcessError as e:
        pass