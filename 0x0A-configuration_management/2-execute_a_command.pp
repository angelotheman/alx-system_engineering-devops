# Kills a process

exec {'Kill the current process':
  command => 'pkill -x killmenow'
}
