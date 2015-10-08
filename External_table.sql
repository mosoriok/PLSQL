ops$tkyte%ORA11GR2> CREATE or replace DIRECTORY exec_dir AS '/tmp'
  2  /

Directory created.

ops$tkyte%ORA11GR2>
ops$tkyte%ORA11GR2> CREATE TABLE ls
  2  (
  3    line varchar2(255)
  4  )
  5  ORGANIZATION external
  6  ( TYPE oracle_loader
  7    DEFAULT DIRECTORY exec_dir
  8    ACCESS PARAMETERS
  9    ( RECORDS DELIMITED BY NEWLINE
 10          preprocessor  exec_dir:'run_ls.sh'
 11      FIELDS TERMINATED BY "|" LDRTRIM
 12    )
 13    location ( 'run_ls.sh')
 14  )
 15  /

Table created.

ops$tkyte%ORA11GR2> select * from ls;

LINE
-------------------------------------------------------------------------------
total 1048
-rw-rw----. 1 ora11gr2 ora11gr2 5251072 Nov  1 14:15 foo.dbf
drwx------. 2 tkyte    tkyte       4096 Jun 30 09:33 keyring-M8U9Ag
-rw-r--r--. 1 ora11gr2 ora11gr2    1153 Nov  1 16:52 LS_31821.log
drwx------. 2 gdm      gdm         4096 Oct 28 17:36 orbit-gdm
drwx------. 2 gdm      gdm         4096 Oct 28 17:36 pulse-QFmfTa6orL3r
drwx------. 2 tkyte    tkyte       4096 Jun 30 09:33 pulse-SLM7wKM200Dt
-rwxrwxr-x. 1 tkyte    tkyte         30 Nov  1 16:52 run_ls.sh

8 rows selected.
