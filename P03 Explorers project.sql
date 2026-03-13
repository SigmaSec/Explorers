CREATE TABLE explorers (
    expID number,
    name VARCHAR2(255),
    username VARCHAR2(255),
    Room_ID number,

    CONSTRAINT explorers_pk PRIMARY KEY (expID),
)

CREATE TABLE npcs (
    npcID number,
    type VARCHAR2(255),
    roomID number,

    CONSTRAINT npcs_pk PRIMARY KEY (npcID),
    CONSTRAINT
)

CREATE TABLE treasure (
    tresID number,
    npcID number,
    roomID number,
    description VARCHAR2(255),
    value number,
    weight number,

    CONSTRAINT treasure_pk PRIMARY KEY (tresID),
    FOREIGN KEY (expID),
    REFERENCES explorers(expID),
    FOREIGN KEY (npcID),
    REFERENCES npc(npcID),
    FOREIGN KEY (roomID),
    REFERENCES room(roomID),
    CONSTRAINT treasure_value_ck CHECK (value > 0),
    CONSTRAINT treasure_weight_ck CHECK (weight > 0)
);

CREATE TABLE room (
    roomID number,
    name VARCHAR2(50),
    description VARCHAR2(255),

    CONSTRAINT room_roomID_pk PRIMARY KEY (roomID),
    CONSTRAINT room_name_ck CHECK NOT NULL,
    CONSTRAINT room_description_ck CHECK NOT NULL
);

CREATE TABLE connection (
    FOREIGN KEY room_
)

