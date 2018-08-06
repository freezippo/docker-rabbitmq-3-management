# docker-rabbitmq-3-management
Docker image based on rabbitmq:3-management, add additional users by environment variables

More information about "base" image you can find [here](https://hub.docker.com/_/rabbitmq/)

Feature of [current fork](https://github.com/freezippo/docker-rabbitmq-3-management/blob/master/Dockerfile):
 - Add additional users to RabbitMQ using environment variables

Used environment variables:
1. X_RABBITMQ_USERS_IN_ADMINISTRATOR
2. X_RABBITMQ_USERS_IN_MONITORING
3. X_RABBITMQ_USERS_IN_POLICYMAKER
4. X_RABBITMQ_USERS_IN_MANAGEMENT
5. X_RABBITMQ_USERS_IN_IMPERSONATOR
6. X_RABBITMQ_USERS_IN_NONE
7. X_RABBITMQ_USER_USERNAME_PASSWORD
8. X_RABBITMQ_USER_USERNAME_VHOST
9. X_RABBITMQ_USER_USERNAME_PERMS

Details for used variables:
1-6  - comma-separated lists of users, username must be set in upper case. At least one group must be specified.
More details for groups described [here](https://www.rabbitmq.com/management.html#permissions)

7  - *required* parameter,  *USERNAME*  must be replaced with actual user
8  - not required parameter, by default '/',  *USERNAME*  must be replaced with actual user
9  - not required parameter, by default '.\*' '.\*' '.\*',  *USERNAME*  must be replaced with actual user


Example of run container:
```
docker run -d -e X_RABBITMQ_USERS_IN_ADMINISTRATOR=ADMIN -e X_RABBITMQ_USER_ADMIN_PASSWORD=admin -e X_RABBITMQ_USERS_IN_NONE=SIMPLEUSER,SIMPLEUSER2 -e X_RABBITMQ_USER_SIMPLEUSER1_PASSWORD=123 -e X_RABBITMQ_USER_SIMPLEUSER2_PASSWORD=124 --hostname rabbitmq_example  --name rabbitmq_example  -p 8080:15672 freezippo/rabbitmq-3-management
```
