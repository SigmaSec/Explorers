CREATE TABLE TREASURES (
    tresID NUMBER,
    expID NUMBER,
    npcID NUMBER,
    roomID NUMBER,
    name VARCHAR2(255),
    description VARCHAR2(255),
    value NUMBER,
    weight NUMBER,

    CONSTRAINT treasure_pk PRIMARY KEY (tresID),
    CONSTRAINT expID_fk FOREIGN KEY (expID) REFERENCES explorers(expID),
    CONSTRAINT npcID_fk FOREIGN KEY (npcID) REFERENCES npcs(npcID),
    CONSTRAINT roomID_fk FOREIGN KEY (roomID) REFERENCES rooms(roomID),
    CONSTRAINT treasure_value_ck CHECK (value > 0),
    CONSTRAINT treasure_weight_ck CHECK (weight >= 0),
    CONSTRAINT has_location_ck CHECK (
        (expID IS NOT NULL AND npcID IS NULL AND roomID IS NULL) OR 
        (npcID IS NOT NULL AND expID IS NULL AND roomID IS NULL) OR
        (roomID IS NOT NULL AND expID IS NULL AND npcID IS NULL)
        )
)