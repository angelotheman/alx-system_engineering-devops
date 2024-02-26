# Kills a process

exec {'Kill the current process':
  command => 'pkill killmenow'
}

