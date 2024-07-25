[![](https://mermaid.ink/img/pako:eNrNV1tv2jAU_iuWn1qJTg2XQvOWUdNFLVCFUG0TUuTGBqwmceQ43Rjlv8-5tBBIWGlVtPCA7fOdY5-7vYQuJxTqkIorhmcC-5MAqG88QtYIPD-fnfEl6Jm3COjA5YHELIjKEMb90DJt5PSH9yYaKXCEn2iO3MSDZTZLvq_mtVozjVvACLi7WRPuDav7zbBO6q3WKQiwTytIcUTFHvKUiUg6ewAe3k-nPmZeBS3EUfSLC1JQxxzYAD9hiYV0psyjjlKsdwMm0EI9ZKFBV5kmNeYJI6cTuOa1zT4a2Ub_DriCYkmJg6Viu0I9Y3xrg-7YUty28wor541DkvNm1FX2l-54sN195lNHLsIq4zzSRZVbhHcEzbJBGm9747SA6A7HA9v6oUBTwf0SQDpxrtHAKkrahB5sSsmkt2FGG323AaGRK1goGQ_WlCvUNftK2ENMZlRurBs2AoJ6FEfUSSyxJiUhR2KBi4LyWAx5JKl4WwjmLIQJ6kq-y3Sn0nc4qGJzeRxIsdjhejH40QI-GyS2N7o2sl78mp9-Ozh2cJmHdz2_Bn6wgFU7v8Ak-GbE5Eb2-ROjOybOjlzhF3yILz_ZKfmu-5K1CCnL1iIimzmJrKTpZMeOtjY82GPvaRypXx8YVy00nC-2UjcxiMOnzgMTcl4hc0YDQsWHE-u_7EJ5H9q6JPwj5bbhb3Hj-xMluUuUGSq7thy7fOXOLVP5-pBi87nHzNrkRwviES4IeUPPA25vd3fertRWsO0QVEaLIuEoBTavhgdoEFIR8aBMhaR8HEuD5Adr0KdCXbuJepKkGkygnFMVL1BXQ4LFYyJxpXA4lny0CFyoSxHTGhQ8ns2hPsVepGbZDvmT5nWVEqbaYT978aQPnxoMcfCTc_9FjJpCfQl_Q_1MazW-NOrtc-3ystnotDsX7RpcJOud5pfmhVrUOufnWvuy3VrV4J9UhqYYNK1TbzbaLa3e7tQbq78rILej?type=png)](https://mermaid.live/edit#pako:eNrNV1tv2jAU_iuWn1qJTg2XQvOWUdNFLVCFUG0TUuTGBqwmceQ43Rjlv8-5tBBIWGlVtPCA7fOdY5-7vYQuJxTqkIorhmcC-5MAqG88QtYIPD-fnfEl6Jm3COjA5YHELIjKEMb90DJt5PSH9yYaKXCEn2iO3MSDZTZLvq_mtVozjVvACLi7WRPuDav7zbBO6q3WKQiwTytIcUTFHvKUiUg6ewAe3k-nPmZeBS3EUfSLC1JQxxzYAD9hiYV0psyjjlKsdwMm0EI9ZKFBV5kmNeYJI6cTuOa1zT4a2Ub_DriCYkmJg6Viu0I9Y3xrg-7YUty28wor541DkvNm1FX2l-54sN195lNHLsIq4zzSRZVbhHcEzbJBGm9747SA6A7HA9v6oUBTwf0SQDpxrtHAKkrahB5sSsmkt2FGG323AaGRK1goGQ_WlCvUNftK2ENMZlRurBs2AoJ6FEfUSSyxJiUhR2KBi4LyWAx5JKl4WwjmLIQJ6kq-y3Sn0nc4qGJzeRxIsdjhejH40QI-GyS2N7o2sl78mp9-Ozh2cJmHdz2_Bn6wgFU7v8Ak-GbE5Eb2-ROjOybOjlzhF3yILz_ZKfmu-5K1CCnL1iIimzmJrKTpZMeOtjY82GPvaRypXx8YVy00nC-2UjcxiMOnzgMTcl4hc0YDQsWHE-u_7EJ5H9q6JPwj5bbhb3Hj-xMluUuUGSq7thy7fOXOLVP5-pBi87nHzNrkRwviES4IeUPPA25vd3fertRWsO0QVEaLIuEoBTavhgdoEFIR8aBMhaR8HEuD5Adr0KdCXbuJepKkGkygnFMVL1BXQ4LFYyJxpXA4lny0CFyoSxHTGhQ8ns2hPsVepGbZDvmT5nWVEqbaYT978aQPnxoMcfCTc_9FjJpCfQl_Q_1MazW-NOrtc-3ystnotDsX7RpcJOud5pfmhVrUOufnWvuy3VrV4J9UhqYYNK1TbzbaLa3e7tQbq78rILej)

erDiagram
USERS ||--o{ FILE : contains
USERS ||--o{ FAVORITE_MOVIES : saves

    USERS  {
        BIGSERIAL id PK
        VARCHAR(255) name
        VARCHAR(255) username
        VARCHAR(255) first_name
        VARCHAR(255) last_name
        VARCHAR(255) email
        VARCHAR(255) password
        BIGINT avatart_file_id FK "REFERENCES FILE (id)"
        TIMESTAMP created_at "DEFAULT CURRENT_TIMESTAMP"
        TIMESTAMP updated_at
    }
    FILE {
        BIGSERIAL id PK
        VARCHAR(255) mime_type
        VARCHAR(255) key
        VARCHAR(255) url
        TIMESTAMP created_at "DEFAULT CURRENT_TIMESTAMP"
        TIMESTAMP updated_at
    }

    MOVIE ||--o{ FILE : contains
    MOVIE ||--o{ COUNTRY : from
    MOVIE ||--o{ MOVIE_GENRE : contains

    MOVIE {
        BIGSERIAL id PK
        VARCHAR(255) title
        TEXT description
        DECIMAL budget
        DATE release_date
        INT duration
        BIGINT poster FK "REFERENCES FILE (id)"
        BIGINT director FK "REFERENCES PERSON (id)"
        BIGINT country FK "REFERENCES COUNTRY (id)"
        TIMESTAMP created_at "DEFAULT CURRENT_TIMESTAMP"
        TIMESTAMP updated_at
    }

    CHARACTER ||--o{ PERSON : contains
    CHARACTER ||--o{ MOVIE : contains

    CHARACTER {
        BIGSERIAL id PK
        VARCHAR(255) name
        TEXT description
        VARCHAR(255) role
        BIGINT movie FK "REFERENCES MOVIE (id)"
        BIGINT actor FK "REFERENCES PERSON (id)"
        TIMESTAMP created_at "DEFAULT CURRENT_TIMESTAMP"
        TIMESTAMP updated_at
    }

    PERSON ||--o{ FILE : contains
    PERSON ||--o{ COUNTRY : from
    PERSON ||--o{ PERSON_FILES : creates

    PERSON {
        BIGSERIAL id PK
        VARCHAR(255) first_name
        VARCHAR(255) last_name
        TEXT biography
        DATE date_of_birth
        VARCHAR(255) gender
        BIGINT country FK "REFERENCES COUNTRY (id)"
        BIGINT avatart_file_id FK "REFERENCES FILE (id)"
        TIMESTAMP created_at "DEFAULT CURRENT_TIMESTAMP"
        TIMESTAMP updated_at
    }

    FAVORITE_MOVIES ||--o{ MOVIE : contains

    FAVORITE_MOVIES {
        BIGSERIAL id PK
        BIGINT movie FK "REFERENCES MOVIE (id)"
        BIGINT user_id FK "REFERENCES USERS (id)"
        TIMESTAMP created_at "DEFAULT CURRENT_TIMESTAMP"
        TIMESTAMP updated_at
    }

    COUNTRY {
        BIGSERIALG id PK
        VARCHAR(255) name
        TIMESTAMP created_at "DEFAULT CURRENT_TIMESTAMP"
        TIMESTAMP updated_at
    }

    GENRE {
        BIGSERIAL id PK
        VARCHAR(255) name
        TIMESTAMP created_at "DEFAULT CURRENT_TIMESTAMP"
        TIMESTAMP updated_at
    }

    MOVIE_GENRE ||--o{ GENRE : contains

    MOVIE_GENRE {
        BIGSERIAL id PK
        BIGINT movie FK
        BIGINT genre FK
        TIMESTAMP created_at "DEFAULT CURRENT_TIMESTAMP"
        TIMESTAMP updated_at
    }

    PERSON_FILES {
        BIGSERIAL id PK
        BIGINT person FK
        BIGINT file FK
        TIMESTAMP created_at "DEFAULT CURRENT_TIMESTAMP"
        TIMESTAMP updated_at
    }
