function embedyoutube
pass show google-dev/youtube-api-key | xargs -I % go-embed-youtube -k % -y $argv
end
