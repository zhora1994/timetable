CREATE TABLE "club"
(
    id BIGSERIAL PRIMARY KEY,
    name TEXT,
    address TEXT,
    rttf_link TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    created_by TEXT NOT NULL,
    deleted_at TIMESTAMP WITHOUT TIME ZONE,
    deleted_by TEXT
);