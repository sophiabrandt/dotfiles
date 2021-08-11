function docker-compose --wraps='docker compose' --description 'alias docker-compose=docker compose'
  docker compose $argv; 
end
