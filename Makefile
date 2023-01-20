# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bbrahim <bbrahim@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/12 15:36:04 by bbrahim           #+#    #+#              #
#    Updated: 2022/12/12 15:36:05 by bbrahim          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

build:
	mkdir -p /Users/bbrahim/Desktop/data
	mkdir -p /Users/bbrahim/Desktop/data/database_volume 
	mkdir -p /Users/bbrahim/Desktop/data/wordpress_volume
	docker-compose -f ./srcs/docker-compose.yml up --build

run:
	docker-compose -f ./srcs/docker-compose.yml up

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean: down
	docker volume rm $$(docker volume ls -q);\
	rm -rf /Users/bbrahim/Desktop/data;\

fclean: down
	docker volume rm $$(docker volume ls -q);\
	docker system prune -a -f;\
	rm -rf /Users/bbrahim/Desktop/data;\

.PHONY: build run stop clean fclean