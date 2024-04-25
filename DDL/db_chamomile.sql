CREATE DATABASE db_chamomile;

create table users
(
    id       int auto_increment invisible,
    username VARCHAR(14)          not null UNIQUE,
    password VARCHAR(60)          not null,
    enable   boolean default true not null,
    constraint id_pk
        primary key (id)
)
    comment 'administrator user';

create table roles
(
    id   int auto_increment,
    name VARCHAR(45) null UNIQUE,
    constraint id_pk
        primary key (id)
);

CREATE TABLE users_roles
(
    users_id INT NOT NULL,
    roles_id INT NOT NULL,
    CONSTRAINT pk_users_roles PRIMARY KEY (users_id, roles_id),
    CONSTRAINT fk_users FOREIGN KEY (users_id) REFERENCES users (id),
    CONSTRAINT fk_roles FOREIGN KEY (roles_id) REFERENCES roles (id)
);