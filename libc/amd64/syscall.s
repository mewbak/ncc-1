# syscall.s - AMD64 system call handling                   ncc standard library
#
#                    Copyright (c) 2021 Charles E. Youse (charles@gnuless.org).
#                       All rights reserved. See LICENSE file for more details.

.comm _errno, 4, 4

.text

# void __exit(int status);

.global ___exit

___exit:        movl $60, %eax

                # fall though to syscall, which doesn't return. this
                # is an unnecessary trick to save a couple of bytes...

# common syscall code. invoke the syscall, then extract
# errno and set the return value to -1 if an error occurred.

do_syscall:     syscall
                testq %rax, %rax
                jns no_error

                neg %eax
                movl %eax, _errno
                movq $-1, %rax

no_error:       ret

# ssize_t read(int fd, void *buf, size_t count);

.global _read

_read:          xorl %eax, %eax
                jmp do_syscall

# ssize_t write(int fd, const void *buf, size_t count);

.global _write

_write:         movl $1, %eax
                jmp do_syscall

# int open(const char *path, int flags);
# int open(const char *path, int flags, mode_t mode);
#
# because of the multiple signtures, open() is declared
# variadic, so we must grab the arguments from the stack.

.global _open

_open:          movq 8(%rsp), %rdi          # path
                movq 16(%rsp), %rsi         # flags
                movq 24(%rsp), %rdx         # mode 
                movl $2, %eax               # SYS_OPEN
                jmp do_syscall

# int close(int fd);

.global _close

_close:         movl $3, %eax               # SYS_CLOSE
                jmp do_syscall

# off_t lseek(int fd, off_t offset, int whence);

.global _lseek

_lseek:         movl $8, %eax
                jmp do_syscall

# void *__brk(void *new);

.global ___brk

___brk:         movl $12, %eax
                jmp do_syscall

# int ioctl(int fd, int request, const void *argp);
#
# the linux abi specifies unsigned long for request instead of int.
# we zap the most significant bits to conform to the posix prototype.

.global _ioctl

_ioctl:         movl $16, %eax
                movl %esi, %esi
                jmp do_syscall

# int access(const char *path, int amode);

.global _access

_access:        movl $21, %eax
                jmp do_syscall

# int creat(const char *pathname, mode_t mode);

.global _creat

_creat:         movl $85, %eax
                jmp do_syscall

# int unlink(const char *path);

.global _unlink

_unlink:        movl $87, %eax
                jmp do_syscall

# time_t time(time_t *timer);

.global _time

_time:          movl $201, %eax
                jmp do_syscall

# vi: set ts=4 expandtab:
