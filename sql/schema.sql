-- posts テーブル
CREATE TABLE posts (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    mime VARCHAR(64) NOT NULL,
    imgdata MEDIUMBLOB NOT NULL,
    body TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);
CREATE INDEX idx_posts_created_at ON posts(created_at DESC);

-- comments テーブル
CREATE TABLE comments (
    id INT NOT NULL AUTO_INCREMENT,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);
CREATE INDEX idx_comments_post_id ON comments(post_id);

-- users テーブル
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    account_name VARCHAR(64) NOT NULL,
    passhash VARCHAR(128) NOT NULL,
    authority TINYINT(1) NOT NULL DEFAULT 0,
    del_flg TINYINT(1) NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY account_name (account_name)
);
CREATE INDEX idx_users_account_name ON users(account_name);
