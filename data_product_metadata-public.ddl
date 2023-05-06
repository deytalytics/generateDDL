CREATE TABLE public.data_product_data_sources (
	id SERIAL NOT NULL, 
	dp_id INTEGER NOT NULL, 
	dst_id INTEGER NOT NULL, 
	name VARCHAR NOT NULL, 
	client_id VARCHAR, 
	client_secret VARCHAR, 
	host_url VARCHAR, 
	"user" VARCHAR, 
	password VARCHAR, 
	token VARCHAR, 
	path VARCHAR, 
	created_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	last_modified_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	CONSTRAINT data_product_data_sources_pkey PRIMARY KEY (id)
);

CREATE TABLE public.data_product_owners (
	id SERIAL NOT NULL, 
	name VARCHAR NOT NULL, 
	contact_email VARCHAR NOT NULL, 
	created_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	last_modified_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	CONSTRAINT data_product_owners_pkey PRIMARY KEY (id)
);

CREATE TABLE public.data_product_tags (
	id SERIAL NOT NULL, 
	dp_id INTEGER NOT NULL, 
	tag VARCHAR NOT NULL, 
	created_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	last_modified_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	CONSTRAINT data_product_tags_pkey PRIMARY KEY (id)
);

CREATE TABLE public.data_product_x_owners (
	id SERIAL NOT NULL, 
	dp_id INTEGER NOT NULL, 
	dpo_id INTEGER NOT NULL, 
	created_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	last_modified_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	CONSTRAINT data_product_x_owners_pkey PRIMARY KEY (id)
);

CREATE TABLE public.data_products (
	id SERIAL NOT NULL, 
	name VARCHAR NOT NULL, 
	root_uri VARCHAR NOT NULL, 
	version VARCHAR NOT NULL, 
	description VARCHAR NOT NULL, 
	security_classification INTEGER NOT NULL, 
	deprecation_date DATE NOT NULL, 
	created_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	last_modified_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	CONSTRAINT data_products_pkey PRIMARY KEY (id)
);

CREATE TABLE public.data_source_data_sharing_agreements (
	id SERIAL NOT NULL, 
	data_source_id INTEGER NOT NULL, 
	name VARCHAR NOT NULL, 
	url_suffix VARCHAR NOT NULL, 
	created_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	last_modified_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	CONSTRAINT data_source_data_sharing_agreements_pkey PRIMARY KEY (id)
);

CREATE TABLE public.data_source_types (
	id SERIAL NOT NULL, 
	data_source_type VARCHAR NOT NULL, 
	created_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	last_modified_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	CONSTRAINT data_source_types_pkey PRIMARY KEY (id)
);

CREATE TABLE public.dp_schemata (
	ds_id INTEGER NOT NULL, 
	ds_version VARCHAR NOT NULL, 
	field_name VARCHAR NOT NULL, 
	field_description VARCHAR NOT NULL, 
	field_datatype VARCHAR NOT NULL, 
	created_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	last_modified_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	CONSTRAINT dp_schemata_pkey PRIMARY KEY (ds_id, ds_version, field_name)
);

CREATE TABLE public.security_classifications (
	id SERIAL NOT NULL, 
	name VARCHAR NOT NULL, 
	created_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	last_modified_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	CONSTRAINT security_classifications_pkey PRIMARY KEY (id)
);

CREATE TABLE public.source_datasets (
	id SERIAL NOT NULL, 
	name VARCHAR NOT NULL, 
	created_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	last_modified_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	CONSTRAINT source_datasets_pkey PRIMARY KEY (id)
);

CREATE TABLE public.target_datasets (
	id SERIAL NOT NULL, 
	name VARCHAR NOT NULL, 
	created_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	last_modified_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	CONSTRAINT target_datasets_pkey PRIMARY KEY (id)
);

CREATE TABLE public.dp_tdsv_pipeline (
	id SERIAL NOT NULL, 
	dp_id INTEGER NOT NULL, 
	td_name VARCHAR NOT NULL, 
	td_version VARCHAR NOT NULL, 
	sql VARCHAR NOT NULL, 
	created_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	last_modified_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	CONSTRAINT dp_tdsv_pipeline_pkey PRIMARY KEY (id), 
	CONSTRAINT dp_tdsv_pipeline_dp_id_fkey FOREIGN KEY(dp_id) REFERENCES public.data_products (id)
);

CREATE TABLE public.source_dataset_versions (
	id SERIAL NOT NULL, 
	ds_id INTEGER NOT NULL, 
	version VARCHAR NOT NULL, 
	created_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	last_modified_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	CONSTRAINT source_dataset_versions_pkey PRIMARY KEY (id), 
	CONSTRAINT source_dataset_versions_ds_id_fkey FOREIGN KEY(ds_id) REFERENCES public.source_datasets (id)
);

CREATE TABLE public.target_dataset_versions (
	id SERIAL NOT NULL, 
	ds_id INTEGER NOT NULL, 
	version VARCHAR NOT NULL, 
	created_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	last_modified_ts TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
	CONSTRAINT target_dataset_versions_pkey PRIMARY KEY (id), 
	CONSTRAINT target_dataset_versions_ds_id_fkey FOREIGN KEY(ds_id) REFERENCES public.target_datasets (id)
);

