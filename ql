                                        Table "public.users"
     Column      |            Type             |                     Modifiers                      
-----------------+-----------------------------+----------------------------------------------------
 id              | integer                     | not null default nextval('users_id_seq'::regclass)
 name            | character varying           | 
 email           | character varying           | 
 created_at      | timestamp without time zone | not null
 updated_at      | timestamp without time zone | not null
 password_digest | character varying           | 
Indexes:
    "users_pkey" PRIMARY KEY, btree (id)
    "index_users_on_email" UNIQUE, btree (email)

