# Завдання 1

# Напишіть скрипт, який автоматично перевіряє, чи доступні певні вебсайти. 
# Скрипт повинен використовувати команду curl для надсилання HTTP GET запитів 
# до кожного сайту у списку та перевірки відповіді.


#!/bin/bash

web_sites=("https://google.com" "https://facebook.com" "https://twitter.com")

file="website_status.log"

for url in "${web_sites[@]}"; do

    status_code=$(curl --write-out "%{http_code}" --silent --output /dev/null -L "$url")

    if [ "$status_code" -eq 200 ]; then
    echo "<$url> is UP" >> $file
    else
    echo "<$url> is DOWN" >> $file
    fi

done

echo "Pезультати записано у файл логів $file"



