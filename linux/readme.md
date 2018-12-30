https://linux.die.net/man/1/bash

-z option will check if the length of the string is zero. it returns 0 if the length is 0

$ if [[ -z "guru" ]]; then  echo "this is zero"; else echo "non zero"; fi

if [[ -z "guru" ]] ; then
  echo "this is zero";
else 
  echo "non zero";
fi

---------

-e option inside the shell if condition is used to check if a file exists or not.

if [ -e /home/tmp.txt ]; then 
echo "file exists"
else
echo "file does not exists"
fi

---------

$@ is the list of parameters passed via command line. not the number of arguments.

$ sample_shell.sh arg1 arg2 arg3 

inside of the shell script if we access $@ it will give all the arguments as string

------------

$# is the number count of the arguments

inside of the shell script of accessing $# will give the number of arguments passed to 
the shell script like $1, $2, $3... basically $@ which is the list of arguments will expand to $1, $2..

------------

echo "something in the first line\n and this is to be in second line"

$ something in the first line\n and this is to be in second line

this just prints in the single line without processing the text

echo -e "something in the first line\n and this is to be in second line"

something in the first line
 and this is to be in second line

--------------

Adding new users in linux

NOTES:
. useradd or adduser can be used. 
. adduser is a symbolic link to useradd
. While adding users there are several files modified. /etc/passwd, /etc/group, /etc/shadow, /etc/gshadow, /var/spool/mail/

. There is a folder called /etc/skel/ short form for skeleton, all the contents of the skel folder will be copied to new users home directory while user is added to the system.
. Look for /etc/login.defs file for settings regarding adding new users with varrious options.

USAGE:
useradd -m -d /home/some_dir_name user_name_to_add

-m says to create the home directory if it is not present

-d says use the specified directory that is provided. if the given directory is not present and if -m is not provided it will not create the home directory

----------------

TO UNDERSTAND:

cat <<-END >&2
this is echoed script
END

how cat is used and what is the redirection present in the odd place