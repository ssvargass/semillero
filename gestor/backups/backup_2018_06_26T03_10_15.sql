--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Debian 10.4-2.pgdg90+1)
-- Dumped by pg_dump version 10.4 (Debian 10.4-2.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO svargas;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO svargas;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO svargas;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO svargas;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO svargas;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO svargas;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO svargas;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO svargas;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO svargas;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO svargas;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: dashboard_userdashboardmodule; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.dashboard_userdashboardmodule (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    module character varying(255) NOT NULL,
    app_label character varying(255),
    "user" integer NOT NULL,
    "column" integer NOT NULL,
    "order" integer NOT NULL,
    settings text NOT NULL,
    children text NOT NULL,
    collapsed boolean NOT NULL,
    CONSTRAINT dashboard_userdashboardmodule_column_check CHECK (("column" >= 0)),
    CONSTRAINT dashboard_userdashboardmodule_user_check CHECK (("user" >= 0))
);


ALTER TABLE public.dashboard_userdashboardmodule OWNER TO svargas;

--
-- Name: dashboard_userdashboardmodule_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.dashboard_userdashboardmodule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_userdashboardmodule_id_seq OWNER TO svargas;

--
-- Name: dashboard_userdashboardmodule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.dashboard_userdashboardmodule_id_seq OWNED BY public.dashboard_userdashboardmodule.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO svargas;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO svargas;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO svargas;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO svargas;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO svargas;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO svargas;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO svargas;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO svargas;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO svargas;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: jet_bookmark; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.jet_bookmark (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    "user" integer NOT NULL,
    date_add timestamp with time zone NOT NULL,
    CONSTRAINT jet_bookmark_user_check CHECK (("user" >= 0))
);


ALTER TABLE public.jet_bookmark OWNER TO svargas;

--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.jet_bookmark_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jet_bookmark_id_seq OWNER TO svargas;

--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.jet_bookmark_id_seq OWNED BY public.jet_bookmark.id;


--
-- Name: jet_pinnedapplication; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.jet_pinnedapplication (
    id integer NOT NULL,
    app_label character varying(255) NOT NULL,
    "user" integer NOT NULL,
    date_add timestamp with time zone NOT NULL,
    CONSTRAINT jet_pinnedapplication_user_check CHECK (("user" >= 0))
);


ALTER TABLE public.jet_pinnedapplication OWNER TO svargas;

--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.jet_pinnedapplication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jet_pinnedapplication_id_seq OWNER TO svargas;

--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.jet_pinnedapplication_id_seq OWNED BY public.jet_pinnedapplication.id;


--
-- Name: proyecto_ambito; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.proyecto_ambito (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE public.proyecto_ambito OWNER TO svargas;

--
-- Name: proyecto_ambito_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.proyecto_ambito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_ambito_id_seq OWNER TO svargas;

--
-- Name: proyecto_ambito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.proyecto_ambito_id_seq OWNED BY public.proyecto_ambito.id;


--
-- Name: proyecto_dificultad; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.proyecto_dificultad (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE public.proyecto_dificultad OWNER TO svargas;

--
-- Name: proyecto_dificultad_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.proyecto_dificultad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_dificultad_id_seq OWNER TO svargas;

--
-- Name: proyecto_dificultad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.proyecto_dificultad_id_seq OWNED BY public.proyecto_dificultad.id;


--
-- Name: proyecto_documento; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.proyecto_documento (
    id integer NOT NULL,
    title character varying(120) NOT NULL,
    descripcion text,
    file character varying(100),
    proyecto_id integer
);


ALTER TABLE public.proyecto_documento OWNER TO svargas;

--
-- Name: proyecto_documento_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.proyecto_documento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_documento_id_seq OWNER TO svargas;

--
-- Name: proyecto_documento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.proyecto_documento_id_seq OWNED BY public.proyecto_documento.id;


--
-- Name: proyecto_grupo; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.proyecto_grupo (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    lider_id integer
);


ALTER TABLE public.proyecto_grupo OWNER TO svargas;

--
-- Name: proyecto_grupo_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.proyecto_grupo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_grupo_id_seq OWNER TO svargas;

--
-- Name: proyecto_grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.proyecto_grupo_id_seq OWNED BY public.proyecto_grupo.id;


--
-- Name: proyecto_hito; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.proyecto_hito (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    descripcion text,
    fecha date,
    proyecto_id integer
);


ALTER TABLE public.proyecto_hito OWNER TO svargas;

--
-- Name: proyecto_hitos_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.proyecto_hitos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_hitos_id_seq OWNER TO svargas;

--
-- Name: proyecto_hitos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.proyecto_hitos_id_seq OWNED BY public.proyecto_hito.id;


--
-- Name: proyecto_influencia; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.proyecto_influencia (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE public.proyecto_influencia OWNER TO svargas;

--
-- Name: proyecto_influencia_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.proyecto_influencia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_influencia_id_seq OWNER TO svargas;

--
-- Name: proyecto_influencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.proyecto_influencia_id_seq OWNED BY public.proyecto_influencia.id;


--
-- Name: proyecto_orientacion; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.proyecto_orientacion (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE public.proyecto_orientacion OWNER TO svargas;

--
-- Name: proyecto_orientacion_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.proyecto_orientacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_orientacion_id_seq OWNER TO svargas;

--
-- Name: proyecto_orientacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.proyecto_orientacion_id_seq OWNED BY public.proyecto_orientacion.id;


--
-- Name: proyecto_proyecto; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.proyecto_proyecto (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    created_by_id integer,
    state character varying(50) NOT NULL,
    dificultad_id integer,
    influencia_id integer,
    abstract text,
    fin date,
    inicio date,
    justificacion text,
    metas text,
    objetivos text,
    resumen text,
    principal_id integer,
    grupo_id integer
);


ALTER TABLE public.proyecto_proyecto OWNER TO svargas;

--
-- Name: proyecto_proyecto_ambito; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.proyecto_proyecto_ambito (
    id integer NOT NULL,
    proyecto_id integer NOT NULL,
    ambito_id integer NOT NULL
);


ALTER TABLE public.proyecto_proyecto_ambito OWNER TO svargas;

--
-- Name: proyecto_proyecto_ambito_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.proyecto_proyecto_ambito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_proyecto_ambito_id_seq OWNER TO svargas;

--
-- Name: proyecto_proyecto_ambito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.proyecto_proyecto_ambito_id_seq OWNED BY public.proyecto_proyecto_ambito.id;


--
-- Name: proyecto_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.proyecto_proyecto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_proyecto_id_seq OWNER TO svargas;

--
-- Name: proyecto_proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.proyecto_proyecto_id_seq OWNED BY public.proyecto_proyecto.id;


--
-- Name: proyecto_proyecto_investigadores; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.proyecto_proyecto_investigadores (
    id integer NOT NULL,
    proyecto_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.proyecto_proyecto_investigadores OWNER TO svargas;

--
-- Name: proyecto_proyecto_investigadores_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.proyecto_proyecto_investigadores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_proyecto_investigadores_id_seq OWNER TO svargas;

--
-- Name: proyecto_proyecto_investigadores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.proyecto_proyecto_investigadores_id_seq OWNED BY public.proyecto_proyecto_investigadores.id;


--
-- Name: proyecto_proyecto_orientacion; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.proyecto_proyecto_orientacion (
    id integer NOT NULL,
    proyecto_id integer NOT NULL,
    orientacion_id integer NOT NULL
);


ALTER TABLE public.proyecto_proyecto_orientacion OWNER TO svargas;

--
-- Name: proyecto_proyecto_orientacion_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.proyecto_proyecto_orientacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_proyecto_orientacion_id_seq OWNER TO svargas;

--
-- Name: proyecto_proyecto_orientacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.proyecto_proyecto_orientacion_id_seq OWNED BY public.proyecto_proyecto_orientacion.id;


--
-- Name: proyecto_proyecto_sector; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.proyecto_proyecto_sector (
    id integer NOT NULL,
    proyecto_id integer NOT NULL,
    sector_id integer NOT NULL
);


ALTER TABLE public.proyecto_proyecto_sector OWNER TO svargas;

--
-- Name: proyecto_proyecto_sector_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.proyecto_proyecto_sector_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_proyecto_sector_id_seq OWNER TO svargas;

--
-- Name: proyecto_proyecto_sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.proyecto_proyecto_sector_id_seq OWNED BY public.proyecto_proyecto_sector.id;


--
-- Name: proyecto_sector; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.proyecto_sector (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE public.proyecto_sector OWNER TO svargas;

--
-- Name: proyecto_sector_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.proyecto_sector_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_sector_id_seq OWNER TO svargas;

--
-- Name: proyecto_sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.proyecto_sector_id_seq OWNED BY public.proyecto_sector.id;


--
-- Name: reversion_revision; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.reversion_revision (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    comment text NOT NULL,
    user_id integer
);


ALTER TABLE public.reversion_revision OWNER TO svargas;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.reversion_revision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_revision_id_seq OWNER TO svargas;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.reversion_revision_id_seq OWNED BY public.reversion_revision.id;


--
-- Name: reversion_version; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.reversion_version (
    id integer NOT NULL,
    object_id character varying(191) NOT NULL,
    format character varying(255) NOT NULL,
    serialized_data text NOT NULL,
    object_repr text NOT NULL,
    content_type_id integer NOT NULL,
    revision_id integer NOT NULL,
    db character varying(191) NOT NULL
);


ALTER TABLE public.reversion_version OWNER TO svargas;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.reversion_version_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_version_id_seq OWNER TO svargas;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.reversion_version_id_seq OWNED BY public.reversion_version.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO svargas;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO svargas;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO svargas;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO svargas;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO svargas;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO svargas;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO svargas;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO svargas;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.users_user OWNER TO svargas;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO svargas;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO svargas;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO svargas;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: svargas
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO svargas;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: svargas
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO svargas;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: svargas
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: dashboard_userdashboardmodule id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.dashboard_userdashboardmodule ALTER COLUMN id SET DEFAULT nextval('public.dashboard_userdashboardmodule_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: jet_bookmark id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.jet_bookmark ALTER COLUMN id SET DEFAULT nextval('public.jet_bookmark_id_seq'::regclass);


--
-- Name: jet_pinnedapplication id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.jet_pinnedapplication ALTER COLUMN id SET DEFAULT nextval('public.jet_pinnedapplication_id_seq'::regclass);


--
-- Name: proyecto_ambito id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_ambito ALTER COLUMN id SET DEFAULT nextval('public.proyecto_ambito_id_seq'::regclass);


--
-- Name: proyecto_dificultad id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_dificultad ALTER COLUMN id SET DEFAULT nextval('public.proyecto_dificultad_id_seq'::regclass);


--
-- Name: proyecto_documento id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_documento ALTER COLUMN id SET DEFAULT nextval('public.proyecto_documento_id_seq'::regclass);


--
-- Name: proyecto_grupo id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_grupo ALTER COLUMN id SET DEFAULT nextval('public.proyecto_grupo_id_seq'::regclass);


--
-- Name: proyecto_hito id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_hito ALTER COLUMN id SET DEFAULT nextval('public.proyecto_hitos_id_seq'::regclass);


--
-- Name: proyecto_influencia id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_influencia ALTER COLUMN id SET DEFAULT nextval('public.proyecto_influencia_id_seq'::regclass);


--
-- Name: proyecto_orientacion id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_orientacion ALTER COLUMN id SET DEFAULT nextval('public.proyecto_orientacion_id_seq'::regclass);


--
-- Name: proyecto_proyecto id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto ALTER COLUMN id SET DEFAULT nextval('public.proyecto_proyecto_id_seq'::regclass);


--
-- Name: proyecto_proyecto_ambito id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_ambito ALTER COLUMN id SET DEFAULT nextval('public.proyecto_proyecto_ambito_id_seq'::regclass);


--
-- Name: proyecto_proyecto_investigadores id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_investigadores ALTER COLUMN id SET DEFAULT nextval('public.proyecto_proyecto_investigadores_id_seq'::regclass);


--
-- Name: proyecto_proyecto_orientacion id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_orientacion ALTER COLUMN id SET DEFAULT nextval('public.proyecto_proyecto_orientacion_id_seq'::regclass);


--
-- Name: proyecto_proyecto_sector id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_sector ALTER COLUMN id SET DEFAULT nextval('public.proyecto_proyecto_sector_id_seq'::regclass);


--
-- Name: proyecto_sector id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_sector ALTER COLUMN id SET DEFAULT nextval('public.proyecto_sector_id_seq'::regclass);


--
-- Name: reversion_revision id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.reversion_revision ALTER COLUMN id SET DEFAULT nextval('public.reversion_revision_id_seq'::regclass);


--
-- Name: reversion_version id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.reversion_version ALTER COLUMN id SET DEFAULT nextval('public.reversion_version_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	admin@ejempli.com	f	f	1
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add content type	3	add_contenttype
8	Can change content type	3	change_contenttype
9	Can delete content type	3	delete_contenttype
10	Can add session	4	add_session
11	Can change session	4	change_session
12	Can delete session	4	delete_session
13	Can add site	5	add_site
14	Can change site	5	change_site
15	Can delete site	5	delete_site
16	Can add log entry	6	add_logentry
17	Can change log entry	6	change_logentry
18	Can delete log entry	6	delete_logentry
19	Can add email address	7	add_emailaddress
20	Can change email address	7	change_emailaddress
21	Can delete email address	7	delete_emailaddress
22	Can add email confirmation	8	add_emailconfirmation
23	Can change email confirmation	8	change_emailconfirmation
24	Can delete email confirmation	8	delete_emailconfirmation
25	Can add social account	9	add_socialaccount
26	Can change social account	9	change_socialaccount
27	Can delete social account	9	delete_socialaccount
28	Can add social application	10	add_socialapp
29	Can change social application	10	change_socialapp
30	Can delete social application	10	delete_socialapp
31	Can add social application token	11	add_socialtoken
32	Can change social application token	11	change_socialtoken
33	Can delete social application token	11	delete_socialtoken
34	Can add user	12	add_user
35	Can change user	12	change_user
36	Can delete user	12	delete_user
37	Can add bookmark	13	add_bookmark
38	Can change bookmark	13	change_bookmark
39	Can delete bookmark	13	delete_bookmark
40	Can add pinned application	14	add_pinnedapplication
41	Can change pinned application	14	change_pinnedapplication
42	Can delete pinned application	14	delete_pinnedapplication
43	Can add user dashboard module	15	add_userdashboardmodule
44	Can change user dashboard module	15	change_userdashboardmodule
45	Can delete user dashboard module	15	delete_userdashboardmodule
46	Can add revision	16	add_revision
47	Can change revision	16	change_revision
48	Can delete revision	16	delete_revision
49	Can add version	17	add_version
50	Can change version	17	change_version
51	Can delete version	17	delete_version
52	Can add Proyecto	18	add_proyecto
53	Can change Proyecto	18	change_proyecto
54	Can delete Proyecto	18	delete_proyecto
55	Can publish project	18	can_publish
56	Can add Dificultad	19	add_dificultad
57	Can change Dificultad	19	change_dificultad
58	Can delete Dificultad	19	delete_dificultad
59	Can add Sector	20	add_sector
60	Can change Sector	20	change_sector
61	Can delete Sector	20	delete_sector
62	Can add Ámbito	21	add_ambito
63	Can change Ámbito	21	change_ambito
64	Can delete Ámbito	21	delete_ambito
65	Can add Orientación	22	add_orientacion
66	Can change Orientación	22	change_orientacion
67	Can delete Orientación	22	delete_orientacion
68	Can add Influencia	23	add_influencia
69	Can change Influencia	23	change_influencia
70	Can delete Influencia	23	delete_influencia
71	Can add Hito	24	add_hitos
72	Can change Hito	24	change_hitos
73	Can delete Hito	24	delete_hitos
74	Can add Documento	25	add_documento
75	Can change Documento	25	change_documento
76	Can delete Documento	25	delete_documento
77	Can add Hito	24	add_hito
78	Can change Hito	24	change_hito
79	Can delete Hito	24	delete_hito
80	Can add Grupo	26	add_grupo
81	Can change Grupo	26	change_grupo
82	Can delete Grupo	26	delete_grupo
\.


--
-- Data for Name: dashboard_userdashboardmodule; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.dashboard_userdashboardmodule (id, title, module, app_label, "user", "column", "order", settings, children, collapsed) FROM stdin;
1	Quick links	jet.dashboard.modules.LinkList	\N	1	0	0	{"draggable": false, "deletable": false, "collapsible": false, "layout": "inline"}	[{"title": "Return to site", "url": "/"}, {"title": "Change password", "url": "/admin/password_change/"}, {"title": "Log out", "url": "/admin/logout/"}]	f
2	Applications	jet.dashboard.modules.AppList	\N	1	1	0	{"models": null, "exclude": ["auth.*"]}		f
3	Administration	jet.dashboard.modules.AppList	\N	1	2	0	{"models": ["auth.*"], "exclude": null}		f
4	Recent Actions	jet.dashboard.modules.RecentActions	\N	1	0	1	{"limit": 10, "include_list": null, "exclude_list": null, "user": null}		f
5	Latest Django News	jet.dashboard.modules.Feed	\N	1	1	1	{"feed_url": "http://www.djangoproject.com/rss/weblog/", "limit": 5}		f
6	Support	jet.dashboard.modules.LinkList	\N	1	2	1	{"draggable": true, "deletable": true, "collapsible": true, "layout": "stacked"}	[{"title": "Django documentation", "url": "http://docs.djangoproject.com/", "external": true}, {"title": "Django \\"django-users\\" mailing list", "url": "http://groups.google.com/group/django-users", "external": true}, {"title": "Django irc channel", "url": "irc://irc.freenode.net/django", "external": true}]	f
7	Application models	jet.dashboard.modules.ModelList	proyecto	1	0	0	{"models": ["proyecto.*"], "exclude": null}		f
8	Recent Actions	jet.dashboard.modules.RecentActions	proyecto	1	1	0	{"limit": 10, "include_list": ["proyecto.*"], "exclude_list": null, "user": null}		f
40	Application models	jet.dashboard.modules.ModelList	users	1	0	0	{"models": ["users.*"], "exclude": null}		f
41	Recent Actions	jet.dashboard.modules.RecentActions	users	1	1	0	{"limit": 10, "include_list": ["users.*"], "exclude_list": null, "user": null}		f
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-06-10 22:14:19.270574+00	1	sadasdas	1	[{"added": {}}]	18	1
34	2018-06-10 22:40:42.751261+00	34	jhgjhgj	1	[{"added": {}}]	18	1
35	2018-06-10 22:40:59.094235+00	34	ejemplo	2	[{"changed": {"fields": ["name"]}}]	18	1
36	2018-06-10 22:41:26.560819+00	34	ejemplo	3		18	1
37	2018-06-10 22:41:33.385217+00	34	ejemplo	2	[]	18	1
38	2018-06-10 22:41:57.563003+00	34	ejemplo	3		18	1
39	2018-06-10 22:41:57.569161+00	1	sadasdas	3		18	1
68	2018-06-10 22:44:09.997711+00	35	jhgjhgjhg	1	[{"added": {}}]	18	1
69	2018-06-10 22:44:59.317698+00	36	jhkjhkj	1	[{"added": {}}]	18	1
70	2018-06-10 22:46:34.724196+00	35	jhgjhgjhg	2	[]	18	1
101	2018-06-10 23:39:28.727191+00	None	ljkl	1	[{"added": {}}]	18	1
134	2018-06-10 23:52:39.445122+00	None	sdsdas	1	[{"added": {}}]	18	1
135	2018-06-10 23:52:51.892251+00	None	sadasda	1	[{"added": {}}]	18	1
136	2018-06-10 23:52:59.1308+00	None	asdasdas	1	[{"added": {}}]	18	1
167	2018-06-10 23:58:52.270277+00	None	sdasda	1	[{"added": {}}]	18	1
168	2018-06-10 23:59:12.073031+00	None	asdasd	1	[{"added": {}}]	18	1
169	2018-06-10 23:59:58.8757+00	None	asdas	1	[{"added": {}}]	18	1
200	2018-06-11 00:06:19.820456+00	None	asdasdas	1	[{"added": {}}]	18	1
201	2018-06-11 00:06:43.541981+00	None	dasdasdas	1	[{"added": {}}]	18	1
202	2018-06-11 00:07:19.826391+00	None	sadasda	1	[{"added": {}}]	18	1
203	2018-06-11 00:18:02.512428+00	None	asdasda	1	[{"added": {}}]	18	1
204	2018-06-11 00:18:35.013628+00	None	sdadas	1	[{"added": {}}]	18	1
205	2018-06-11 00:21:31.066826+00	None	Sergio	1	[{"added": {}}]	18	1
206	2018-06-11 00:23:08.656086+00	None	sadas	1	[{"added": {}}]	18	1
207	2018-06-11 00:23:29.894013+00	68	Sergio	1	[{"added": {}}]	18	1
208	2018-06-11 00:26:29.95908+00	1	admin	2	[{"changed": {"fields": ["name"]}}]	12	1
209	2018-06-11 00:26:50.784707+00	1	admin	2	[{"changed": {"fields": ["user_permissions"]}}]	12	1
242	2018-06-11 00:38:09.796791+00	69	okpok	1	[{"added": {}}]	18	1
243	2018-06-11 01:09:19.539716+00	68	Sergio	2	[{"changed": {"fields": ["state"]}}]	18	1
244	2018-06-11 01:09:26.220432+00	68	Sergio	2	[{"changed": {"fields": ["state"]}}]	18	1
245	2018-06-11 01:09:30.913767+00	68	Sergio	2	[{"changed": {"fields": ["state"]}}]	18	1
246	2018-06-11 01:09:34.492305+00	68	Sergio	2	[{"changed": {"fields": ["state"]}}]	18	1
247	2018-06-11 05:54:17.852035+00	71	Steven	1	[{"added": {}}]	18	1
248	2018-06-11 05:54:43.607216+00	71	Stevens	2	[{"changed": {"fields": ["name"]}}]	18	1
249	2018-06-11 17:14:18.221453+00	71	Stevens Sergio	2	[{"changed": {"fields": ["name"]}}]	18	1
250	2018-06-11 18:15:28.277223+00	1	Simple	1	[{"added": {}}]	19	1
251	2018-06-11 18:15:36.537566+00	2	Complejo	1	[{"added": {}}]	19	1
252	2018-06-11 18:16:03.953725+00	72	Administrador de proyectos de los semilleros de investigación	1	[{"added": {}}]	18	1
253	2018-06-11 19:05:50.717269+00	1	Construcción	1	[{"added": {}}]	20	1
254	2018-06-11 19:06:10.446343+00	2	Energía	1	[{"added": {}}]	20	1
255	2018-06-11 19:06:23.431794+00	3	Minería	1	[{"added": {}}]	20	1
256	2018-06-11 19:10:31.133703+00	73	Sector y nivel	1	[{"added": {}}]	18	1
257	2018-06-11 19:12:52.561427+00	73	Sector y nivel	2	[{"changed": {"fields": ["sector"]}}]	18	1
258	2018-06-11 19:24:21.288366+00	4	Sergio	1	[{"added": {}}]	21	1
259	2018-06-11 19:24:40.418307+00	74	example with ambito	1	[{"added": {}}]	18	1
260	2018-06-11 19:28:34.48916+00	6	Ingeniería	1	[{"added": {}}]	21	1
261	2018-06-11 19:28:36.442348+00	75	Example	1	[{"added": {}}]	18	1
262	2018-06-11 19:39:27.196854+00	1	Productivo	1	[{"added": {}}]	22	1
263	2018-06-11 19:39:29.543722+00	75	Example	2	[{"changed": {"fields": ["orientacion"]}}]	18	1
264	2018-06-11 19:52:46.156489+00	1	Nacional	1	[{"added": {}}]	23	1
265	2018-06-11 19:52:48.453576+00	75	Example	2	[{"changed": {"fields": ["influencia"]}}]	18	1
266	2018-06-11 20:31:15.368938+00	74	example with ambito	2	[]	18	1
267	2018-06-11 20:31:18.034109+00	74	example with ambito	2	[{"changed": {"fields": ["state"]}}]	18	1
268	2018-06-11 20:31:26.404206+00	73	Sector y nivel	2	[{"changed": {"fields": ["state"]}}]	18	1
269	2018-06-11 21:50:22.874354+00	73	Sector y nivel	2	[{"changed": {"fields": ["state"]}}]	18	1
270	2018-06-12 00:33:05.621882+00	1	Entrega articulo cientifico	1	[{"added": {}}]	24	1
271	2018-06-12 01:26:58.394481+00	1	sdsada	1	[{"added": {}}]	25	1
272	2018-06-12 01:43:10.601692+00	74	example with ambito	2	[{"changed": {"fields": ["inicio", "principal"]}}]	18	1
273	2018-06-12 01:45:13.666458+00	74	example with ambito	2	[{"changed": {"fields": ["resumen"]}}]	18	1
274	2018-06-12 01:48:25.697097+00	1	My grupo	1	[{"added": {}}]	26	1
275	2018-06-12 01:48:28.615397+00	74	example with ambito	2	[{"changed": {"fields": ["grupo"]}}]	18	1
276	2018-06-12 01:51:56.888231+00	2	My hito	1	[{"added": {}}]	24	1
277	2018-06-12 01:51:59.054386+00	74	example with ambito	2	[{"changed": {"fields": ["hitos"]}}]	18	1
278	2018-06-12 01:52:40.070563+00	3	My second hito	1	[{"added": {}}]	24	1
279	2018-06-12 01:52:42.586503+00	74	example with ambito	2	[{"changed": {"fields": ["hitos"]}}]	18	1
280	2018-06-12 01:55:26.606501+00	74	example with ambito	2	[{"changed": {"fields": ["investigadores"]}}]	18	1
281	2018-06-12 01:56:08.860042+00	74	example with ambito	2	[{"changed": {"fields": ["abstract"]}}]	18	1
282	2018-06-12 06:09:28.179822+00	75	Example	2	[{"changed": {"fields": ["principal"]}}]	18	1
283	2018-06-13 01:12:47.848161+00	2	cgila	1	[{"added": {}}]	12	1
284	2018-06-13 01:12:51.936856+00	2	GUIAS	1	[{"added": {}}]	26	1
285	2018-06-13 01:14:18.492563+00	4	Presentar a rticulo cientifico	1	[{"added": {}}]	24	1
286	2018-06-13 01:15:32.598817+00	2	Internacional	1	[{"added": {}}]	23	1
287	2018-06-13 01:16:01.640265+00	76	Este eds un demo	1	[{"added": {}}]	18	1
288	2018-06-13 01:16:37.286116+00	76	Este eds un demo	2	[{"changed": {"fields": ["state"]}}]	18	1
289	2018-06-13 01:18:13.238003+00	76	Este eds un demo	2	[{"changed": {"fields": ["abstract", "metas"]}}]	18	1
290	2018-06-13 01:19:28.940099+00	76	Este eds un demo	3		18	1
291	2018-06-13 01:19:45.079899+00	76	Este eds un demo	2	[]	18	1
292	2018-06-13 01:27:10.560221+00	2	cgila	2	[{"changed": {"fields": ["first_name"]}}]	12	1
293	2018-06-13 01:27:21.300433+00	76	Este eds un demo	2	[]	18	1
294	2018-06-17 19:43:33.202175+00	77	Example	1	[{"added": {}}, {"added": {"name": "Documento", "object": "Articulo"}}]	18	1
295	2018-06-17 19:43:48.624142+00	77	Example	2	[{"changed": {"name": "Documento", "object": "Articulo", "fields": ["file"]}}]	18	1
296	2018-06-17 20:33:53.855607+00	74	example with ambito	2	[{"added": {"name": "Documento", "object": "EXAMPE"}}]	18	1
297	2018-06-19 22:54:53.845024+00	2	cgila	2	[{"changed": {"fields": ["name"]}}]	12	1
298	2018-06-19 22:55:08.809744+00	2	cgila	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	12	1
299	2018-06-19 22:57:22.867321+00	4	Agropecuario	1	[{"added": {}}]	20	1
300	2018-06-19 22:57:40.844472+00	5	Agronica	1	[{"added": {}}]	20	1
301	2018-06-19 22:58:46.840001+00	78	Sistema de riego automatico para jardines	1	[{"added": {}}, {"added": {"name": "Hito", "object": "Entrega del proyecto"}}, {"added": {"name": "Documento", "object": "Propiedad"}}]	18	1
302	2018-06-19 22:59:07.734834+00	78	Sistema de riego automatico para jardines	2	[{"changed": {"fields": ["state"]}}]	18	1
303	2018-06-19 22:59:12.194038+00	78	Sistema de riego automatico para jardines	2	[{"changed": {"fields": ["state"]}}]	18	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	sessions	session
5	sites	site
6	admin	logentry
7	account	emailaddress
8	account	emailconfirmation
9	socialaccount	socialaccount
10	socialaccount	socialapp
11	socialaccount	socialtoken
12	users	user
13	jet	bookmark
14	jet	pinnedapplication
15	dashboard	userdashboardmodule
16	reversion	revision
17	reversion	version
18	proyecto	proyecto
19	proyecto	dificultad
20	proyecto	sector
21	proyecto	ambito
22	proyecto	orientacion
23	proyecto	influencia
24	proyecto	hito
25	proyecto	documento
26	proyecto	grupo
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-06-06 21:02:16.947113+00
2	contenttypes	0002_remove_content_type_name	2018-06-06 21:02:16.959132+00
3	auth	0001_initial	2018-06-06 21:02:16.996692+00
4	auth	0002_alter_permission_name_max_length	2018-06-06 21:02:17.003689+00
5	auth	0003_alter_user_email_max_length	2018-06-06 21:02:17.009795+00
6	auth	0004_alter_user_username_opts	2018-06-06 21:02:17.017451+00
7	auth	0005_alter_user_last_login_null	2018-06-06 21:02:17.024283+00
8	auth	0006_require_contenttypes_0002	2018-06-06 21:02:17.026904+00
9	auth	0007_alter_validators_add_error_messages	2018-06-06 21:02:17.034263+00
10	auth	0008_alter_user_username_max_length	2018-06-06 21:02:17.04052+00
11	users	0001_initial	2018-06-06 21:02:17.081296+00
12	account	0001_initial	2018-06-06 21:02:17.120227+00
13	account	0002_email_max_length	2018-06-06 21:02:17.130569+00
14	admin	0001_initial	2018-06-06 21:02:17.154397+00
15	admin	0002_logentry_remove_auto_add	2018-06-06 21:02:17.187712+00
16	auth	0009_alter_user_last_name_max_length	2018-06-06 21:02:17.198494+00
17	sessions	0001_initial	2018-06-06 21:02:17.212068+00
18	sites	0001_initial	2018-06-06 21:02:17.221387+00
19	sites	0002_alter_domain_unique	2018-06-06 21:02:17.230771+00
20	sites	0003_set_site_domain_and_name	2018-06-06 21:02:17.246292+00
21	socialaccount	0001_initial	2018-06-06 21:02:17.321287+00
22	socialaccount	0002_token_max_lengths	2018-06-06 21:02:17.344494+00
23	socialaccount	0003_extra_data_default_dict	2018-06-06 21:02:17.355916+00
24	jet	0001_initial	2018-06-10 21:02:43.053131+00
25	jet	0002_delete_userdashboardmodule	2018-06-10 21:02:43.064625+00
26	dashboard	0001_initial	2018-06-10 21:06:00.737309+00
27	proyecto	0001_initial	2018-06-10 21:50:50.765127+00
28	reversion	0001_initial	2018-06-10 21:50:50.882086+00
29	reversion	0002_auto_20141216_1509	2018-06-10 21:50:50.884081+00
30	reversion	0003_auto_20160601_1600	2018-06-10 21:50:50.886653+00
31	reversion	0004_auto_20160611_1202	2018-06-10 21:50:50.889019+00
32	reversion	0001_squashed_0004_auto_20160611_1202	2018-06-10 21:50:50.894389+00
33	proyecto	0002_auto_20180610_2201	2018-06-10 22:01:55.1718+00
66	proyecto	0003_auto_20180610_2203	2018-06-10 22:04:44.690365+00
67	proyecto	0004_auto_20180610_2205	2018-06-10 22:05:51.762451+00
68	proyecto	0005_proyecto_state	2018-06-10 22:06:25.858132+00
99	proyecto	0006_remove_proyecto_state	2018-06-10 22:14:00.756585+00
132	proyecto	0007_proyecto_state	2018-06-11 00:24:54.687104+00
133	proyecto	0008_auto_20180611_1809	2018-06-11 18:09:54.439192+00
134	proyecto	0009_auto_20180611_1902	2018-06-11 19:03:20.439365+00
135	proyecto	0010_auto_20180611_1903	2018-06-11 19:03:20.508233+00
136	proyecto	0011_auto_20180611_1918	2018-06-11 19:18:29.938426+00
137	proyecto	0012_auto_20180611_1939	2018-06-11 19:39:10.195507+00
138	proyecto	0013_auto_20180611_1951	2018-06-11 19:52:00.160644+00
139	proyecto	0014_auto_20180611_2129	2018-06-11 21:29:36.382053+00
140	proyecto	0015_auto_20180611_2148	2018-06-11 21:49:01.801959+00
141	proyecto	0016_proyecto_hitos	2018-06-12 00:24:10.71852+00
174	proyecto	0017_auto_20180612_0030	2018-06-12 00:30:58.194435+00
175	proyecto	0018_auto_20180612_0042	2018-06-12 00:43:16.427827+00
208	proyecto	0019_proyecto_investigadores	2018-06-12 00:46:04.89134+00
241	proyecto	0020_auto_20180612_0120	2018-06-12 01:20:30.3535+00
242	proyecto	0021_auto_20180612_0128	2018-06-12 01:28:18.879774+00
243	proyecto	0022_auto_20180612_0137	2018-06-12 01:37:14.894673+00
276	proyecto	0023_proyecto_comentario	2018-06-13 01:32:17.293607+00
277	proyecto	0024_remove_proyecto_comentario	2018-06-17 19:19:44.257933+00
278	proyecto	0025_remove_proyecto_documentos	2018-06-17 19:40:09.517403+00
279	proyecto	0026_documento_proyecto	2018-06-17 19:41:55.319121+00
280	proyecto	0027_auto_20180617_1950	2018-06-17 19:50:12.845642+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
1jaj5wfi7g5sn8vdhzw1ceelrsg0469y	NzBlYzJmNjI3NTg4ZmI1NDAyM2FiMDY2ZjI3ZDEzYTczMzZkMTY5ZTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQxM2M4OTZiN2I1NmYyYmQ2ZGVhMTk2YTg5ZGZlNmJiZDQ0ZThlZTkifQ==	2018-06-21 03:27:34.16511+00
i4eb30u3wgb49gk2iprrbtrqr2m3l69u	MzJhMTc3NjlmODBmZGQ0MjU4YThiM2I0ZDcyYTljZTM3NGM5MDQ1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MTNjODk2YjdiNTZmMmJkNmRlYTE5NmE4OWRmZTZiYmQ0NGU4ZWU5In0=	2018-06-25 00:16:59.560801+00
vighnoh0d19rgovysi6fxv9qh3jv47kf	MzJhMTc3NjlmODBmZGQ0MjU4YThiM2I0ZDcyYTljZTM3NGM5MDQ1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MTNjODk2YjdiNTZmMmJkNmRlYTE5NmE4OWRmZTZiYmQ0NGU4ZWU5In0=	2018-07-01 18:53:20.706502+00
2bbartpg5z0o8m7d0jgz0743fgm4ptll	MzJhMTc3NjlmODBmZGQ0MjU4YThiM2I0ZDcyYTljZTM3NGM5MDQ1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MTNjODk2YjdiNTZmMmJkNmRlYTE5NmE4OWRmZTZiYmQ0NGU4ZWU5In0=	2018-07-03 22:52:33.159795+00
5yukxxbmj7qmeyiplek89vs5a3yejp9s	MzJhMTc3NjlmODBmZGQ0MjU4YThiM2I0ZDcyYTljZTM3NGM5MDQ1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MTNjODk2YjdiNTZmMmJkNmRlYTE5NmE4OWRmZTZiYmQ0NGU4ZWU5In0=	2018-07-06 01:49:31.840081+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.django_site (id, domain, name) FROM stdin;
1	ssvargass	Semillero
\.


--
-- Data for Name: jet_bookmark; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.jet_bookmark (id, url, title, "user", date_add) FROM stdin;
\.


--
-- Data for Name: jet_pinnedapplication; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.jet_pinnedapplication (id, app_label, "user", date_add) FROM stdin;
\.


--
-- Data for Name: proyecto_ambito; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.proyecto_ambito (id, name) FROM stdin;
4	Sergio
6	Ingeniería
\.


--
-- Data for Name: proyecto_dificultad; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.proyecto_dificultad (id, name) FROM stdin;
1	Simple
2	Complejo
\.


--
-- Data for Name: proyecto_documento; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.proyecto_documento (id, title, descripcion, file, proyecto_id) FROM stdin;
1	sdsada	<p>asdasda</p>		\N
2	Articulo	<p>dasdasdas</p>	uploads/propiedad-intelectual.pdf	77
3	EXAMPE			74
4	Propiedad		uploads/propiedad-intelectual_FAJERLc.pdf	78
\.


--
-- Data for Name: proyecto_grupo; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.proyecto_grupo (id, name, lider_id) FROM stdin;
1	My grupo	1
2	GUIAS	2
\.


--
-- Data for Name: proyecto_hito; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.proyecto_hito (id, name, descripcion, fecha, proyecto_id) FROM stdin;
1	Entrega articulo cientifico		2018-06-21	\N
2	My hito	<p>this is a hito</p>	2018-06-20	\N
3	My second hito	<p>another hito</p>	2018-06-04	\N
4	Presentar a rticulo cientifico	<p>es necesasdasda</p>	2018-06-29	\N
5	Entrega del proyecto		2018-06-28	78
\.


--
-- Data for Name: proyecto_influencia; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.proyecto_influencia (id, name) FROM stdin;
1	Nacional
2	Internacional
\.


--
-- Data for Name: proyecto_orientacion; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.proyecto_orientacion (id, name) FROM stdin;
1	Productivo
\.


--
-- Data for Name: proyecto_proyecto; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.proyecto_proyecto (id, name, created, created_by_id, state, dificultad_id, influencia_id, abstract, fin, inicio, justificacion, metas, objetivos, resumen, principal_id, grupo_id) FROM stdin;
36	jhkjhkj	2018-06-10 22:44:59.300289+00	\N	borrador	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	jhgjhgjhg	2018-06-10 22:44:09.969127+00	\N	borrador	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
69	okpok	2018-06-11 00:38:09.774051+00	1	borrador	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
68	Sergio	2018-06-11 00:23:29.865692+00	1	publicado	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
76	Este eds un demo	2018-06-13 01:16:00.955+00	1	revisado	1	2	<p>asdasdas</p>\r\n<p>\\asdasdas</p>\r\n<p>adsdasd</p>\r\n<p>as</p>	2018-06-30	2018-02-01	<p dir="ltr"><span>Para este proyecto la poblaci&oacute;n objetivo es la comunidad acad&eacute;mica de la fundaci&oacute;n universitaria los libertadores</span></p>\r\n<p><span>&nbsp;</span></p>	<p>asdasd</p>\r\n<p>asd</p>\r\n<p>sadas</p>	<ol>\r\n<li dir="ltr">\r\n<p dir="ltr"><span>Generar un inventario de los proyecto de investigaci&oacute;n activos de la FULL.</span></p>\r\n</li>\r\n<li dir="ltr">\r\n<p dir="ltr"><span>Estudiar el avance investigativo de la universidad durante el tiempo.</span></p>\r\n</li>\r\n<li dir="ltr">\r\n<p dir="ltr"><span>Motivar y reconocer a los j&oacute;venes investigadores de la FULL</span></p>\r\n</li>\r\n<li dir="ltr">\r\n<p dir="ltr"><span>Apoyar los proyectos de investigaci&oacute;n.</span></p>\r\n</li>\r\n</ol>	<p><span id="docs-internal-guid-b1d1c95d-f6b4-4c29-3fd0-9cf83a68ce6b"><span>La fundaci&oacute;n Universitaria los Libertadores viene adelantando desde el a&ntilde;o &hellip;&hellip;. diferentes l&iacute;neas de investigaci&oacute;n agrupadas en semilleros, estos a su vez tienen grupos encargados de adelantar, proponer y mejorar los diferentes proyectos de investigaci&oacute;n de la universidad. En la actualidad los proyectos est&aacute;n supervisados por los profesores, y el avance est&aacute; en su mayor&iacute;a en f&iacute;sico, este proyecto busca generar una herramienta para el control, socializaci&oacute;n y almacenamiento de la informaci&oacute;n relevante de los proyectos.</span></span></p>	2	2
71	Stevens Sergio	2018-06-11 05:54:17.743629+00	1	borrador	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
72	Administrador de proyectos de los semilleros de investigación	2018-06-11 18:16:03.798535+00	1	borrador	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
77	Example	2018-06-17 19:43:32.410747+00	1	borrador	\N	\N		\N	\N					2	\N
74	example with ambito	2018-06-11 19:24:40.155513+00	1	revisado	2	\N	<p>asdasdas</p>	\N	2018-06-27				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p>&nbsp;</p>	1	1
78	Sistema de riego automatico para jardines	2018-06-19 22:58:45.565465+00	1	publicado	2	1		2018-06-30	2018-02-01				<p>Este es un ejemplo de un proyecto asociado al grupo de investigacion GUIAS, este se trata de un sistema automatizado de riesgos.</p>	2	2
73	Sector y nivel	2018-06-11 19:10:30.972556+00	1	borrador	1	\N		\N	\N					\N	\N
75	Example	2018-06-11 19:28:36.189316+00	1	borrador	1	1		\N	\N					1	\N
\.


--
-- Data for Name: proyecto_proyecto_ambito; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.proyecto_proyecto_ambito (id, proyecto_id, ambito_id) FROM stdin;
1	74	4
2	75	6
5	76	6
6	78	6
\.


--
-- Data for Name: proyecto_proyecto_investigadores; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.proyecto_proyecto_investigadores (id, proyecto_id, user_id) FROM stdin;
1	74	1
2	78	1
\.


--
-- Data for Name: proyecto_proyecto_orientacion; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.proyecto_proyecto_orientacion (id, proyecto_id, orientacion_id) FROM stdin;
1	75	1
4	76	1
5	78	1
\.


--
-- Data for Name: proyecto_proyecto_sector; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.proyecto_proyecto_sector (id, proyecto_id, sector_id) FROM stdin;
1	73	1
2	73	2
4	74	1
5	75	2
8	76	2
9	78	5
\.


--
-- Data for Name: proyecto_sector; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.proyecto_sector (id, name) FROM stdin;
1	Construcción
2	Energía
3	Minería
4	Agropecuario
5	Agronica
\.


--
-- Data for Name: reversion_revision; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.reversion_revision (id, date_created, comment, user_id) FROM stdin;
1	2018-06-10 22:40:42.679325+00	Added.	1
2	2018-06-10 22:40:58.995374+00	Changed name.	1
3	2018-06-10 22:41:33.356139+00	Reverted to previous version, saved on June 10, 2018, 10:40 p.m.	1
35	2018-06-10 22:44:09.928431+00	Added.	1
36	2018-06-10 22:44:59.274941+00	Added.	1
37	2018-06-10 22:46:34.654513+00	No fields changed.	1
68	2018-06-11 00:23:29.823658+00	Added.	1
69	2018-06-11 00:38:09.758763+00	Added.	1
70	2018-06-11 01:09:19.451342+00	Changed state.	1
71	2018-06-11 01:09:26.173666+00	Changed state.	1
72	2018-06-11 01:09:30.792798+00	Changed state.	1
73	2018-06-11 01:09:34.398844+00	Changed state.	1
74	2018-06-11 05:54:17.715217+00	Added.	1
75	2018-06-11 05:54:43.316568+00	Changed name.	1
76	2018-06-11 17:14:18.123296+00	Changed name.	1
77	2018-06-11 18:16:03.757218+00	Added.	1
78	2018-06-11 19:10:30.917976+00	Added.	1
79	2018-06-11 19:12:52.357+00	Changed sector.	1
80	2018-06-11 19:24:40.100771+00	Added.	1
81	2018-06-11 19:28:36.136661+00	Added.	1
82	2018-06-11 19:39:29.209517+00	Changed orientacion.	1
83	2018-06-11 19:52:48.21388+00	Changed influencia.	1
84	2018-06-11 20:31:14.973996+00	No fields changed.	1
85	2018-06-11 20:31:17.799942+00	Changed state.	1
86	2018-06-11 20:31:26.206364+00	Changed state.	1
87	2018-06-11 21:50:22.410218+00	Changed state.	1
88	2018-06-12 01:43:10.07875+00	Changed inicio and principal.	1
89	2018-06-12 01:45:13.245001+00	Changed resumen.	1
90	2018-06-12 01:48:28.294193+00	Changed grupo.	1
91	2018-06-12 01:51:58.592226+00	Changed hitos.	1
92	2018-06-12 01:52:42.179698+00	Changed hitos.	1
93	2018-06-12 01:55:25.88749+00	Changed investigadores.	1
94	2018-06-12 01:56:08.246365+00	Changed abstract.	1
95	2018-06-12 06:09:27.672538+00	Changed principal.	1
96	2018-06-13 01:16:00.673064+00	Added.	1
97	2018-06-13 01:16:36.852703+00	Changed state.	1
98	2018-06-13 01:18:12.747317+00	Changed abstract and metas.	1
99	2018-06-13 01:19:44.781681+00	Reverted to previous version, saved on June 13, 2018, 1:18 a.m.	1
100	2018-06-13 01:27:20.930554+00	No fields changed.	1
101	2018-06-17 19:43:32.366417+00	Added. Added Documento "Articulo".	1
102	2018-06-17 19:43:48.236247+00	Changed file for Documento "Articulo".	1
103	2018-06-17 20:33:53.365263+00	Added Documento "EXAMPE".	1
104	2018-06-19 22:58:45.340424+00	Added. Added Hito "Entrega del proyecto". Added Documento "Propiedad".	1
105	2018-06-19 22:59:07.260574+00	Changed state.	1
106	2018-06-19 22:59:11.810574+00	Changed state.	1
\.


--
-- Data for Name: reversion_version; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.reversion_version (id, object_id, format, serialized_data, object_repr, content_type_id, revision_id, db) FROM stdin;
1	34	json	[{"model": "proyecto.proyecto", "pk": 34, "fields": {"name": "jhgjhgj", "created": "2018-06-10T22:40:42.725Z", "created_by": 1}}]	jhgjhgj	18	1	default
2	34	json	[{"model": "proyecto.proyecto", "pk": 34, "fields": {"name": "ejemplo", "created": "2018-06-10T22:40:42.725Z", "created_by": 1}}]	ejemplo	18	2	default
3	34	json	[{"model": "proyecto.proyecto", "pk": 34, "fields": {"name": "ejemplo", "created": "2018-06-10T22:40:42.725Z", "created_by": 1}}]	ejemplo	18	3	default
35	35	json	[{"model": "proyecto.proyecto", "pk": 35, "fields": {"name": "jhgjhgjhg", "created": "2018-06-10T22:44:09.969Z", "created_by": null}}]	jhgjhgjhg	18	35	default
36	36	json	[{"model": "proyecto.proyecto", "pk": 36, "fields": {"name": "jhkjhkj", "created": "2018-06-10T22:44:59.300Z", "created_by": null}}]	jhkjhkj	18	36	default
37	35	json	[{"model": "proyecto.proyecto", "pk": 35, "fields": {"name": "jhgjhgjhg", "created": "2018-06-10T22:44:09.969Z", "created_by": null}}]	jhgjhgjhg	18	37	default
68	68	json	[{"model": "proyecto.proyecto", "pk": 68, "fields": {"name": "Sergio", "created": "2018-06-11T00:23:29.865Z", "created_by": 1}}]	Sergio	18	68	default
69	69	json	[{"model": "proyecto.proyecto", "pk": 69, "fields": {"name": "okpok", "created": "2018-06-11T00:38:09.774Z", "created_by": 1, "state": "borrador"}}]	okpok	18	69	default
70	68	json	[{"model": "proyecto.proyecto", "pk": 68, "fields": {"name": "Sergio", "created": "2018-06-11T00:23:29.865Z", "created_by": 1, "state": "revisado"}}]	Sergio	18	70	default
71	68	json	[{"model": "proyecto.proyecto", "pk": 68, "fields": {"name": "Sergio", "created": "2018-06-11T00:23:29.865Z", "created_by": 1, "state": "borrador"}}]	Sergio	18	71	default
72	68	json	[{"model": "proyecto.proyecto", "pk": 68, "fields": {"name": "Sergio", "created": "2018-06-11T00:23:29.865Z", "created_by": 1, "state": "revisado"}}]	Sergio	18	72	default
73	68	json	[{"model": "proyecto.proyecto", "pk": 68, "fields": {"name": "Sergio", "created": "2018-06-11T00:23:29.865Z", "created_by": 1, "state": "publicado"}}]	Sergio	18	73	default
74	71	json	[{"model": "proyecto.proyecto", "pk": 71, "fields": {"name": "Steven", "created": "2018-06-11T05:54:17.743Z", "created_by": 1, "state": "borrador"}}]	Steven	18	74	default
75	71	json	[{"model": "proyecto.proyecto", "pk": 71, "fields": {"name": "Stevens", "created": "2018-06-11T05:54:17.743Z", "created_by": 1, "state": "borrador"}}]	Stevens	18	75	default
76	71	json	[{"model": "proyecto.proyecto", "pk": 71, "fields": {"name": "Stevens Sergio", "created": "2018-06-11T05:54:17.743Z", "created_by": 1, "state": "borrador"}}]	Stevens Sergio	18	76	default
77	72	json	[{"model": "proyecto.proyecto", "pk": 72, "fields": {"name": "Administrador de proyectos de los semilleros de investigaci\\u00f3n", "dificultad": 2, "created": "2018-06-11T18:16:03.798Z", "created_by": 1, "state": "borrador"}}]	Administrador de proyectos de los semilleros de investigación	18	77	default
78	73	json	[{"model": "proyecto.proyecto", "pk": 73, "fields": {"name": "Sector y nivel", "dificultad": 1, "created": "2018-06-11T19:10:30.972Z", "created_by": 1, "state": "borrador", "sector": [1, 2, 3]}}]	Sector y nivel	18	78	default
79	73	json	[{"model": "proyecto.proyecto", "pk": 73, "fields": {"name": "Sector y nivel", "dificultad": 1, "created": "2018-06-11T19:10:30.972Z", "created_by": 1, "state": "borrador", "sector": [1, 2]}}]	Sector y nivel	18	79	default
80	74	json	[{"model": "proyecto.proyecto", "pk": 74, "fields": {"name": "example with ambito", "dificultad": 2, "created": "2018-06-11T19:24:40.155Z", "created_by": 1, "state": "borrador", "sector": [1], "ambito": [4]}}]	example with ambito	18	80	default
81	75	json	[{"model": "proyecto.proyecto", "pk": 75, "fields": {"name": "Example", "dificultad": 1, "created": "2018-06-11T19:28:36.189Z", "created_by": 1, "state": "borrador", "sector": [2], "ambito": [6]}}]	Example	18	81	default
82	75	json	[{"model": "proyecto.proyecto", "pk": 75, "fields": {"name": "Example", "dificultad": 1, "created": "2018-06-11T19:28:36.189Z", "created_by": 1, "state": "borrador", "sector": [2], "ambito": [6], "orientacion": [1]}}]	Example	18	82	default
83	75	json	[{"model": "proyecto.proyecto", "pk": 75, "fields": {"name": "Example", "dificultad": 1, "influencia": 1, "created": "2018-06-11T19:28:36.189Z", "created_by": 1, "state": "borrador", "sector": [2], "ambito": [6], "orientacion": [1]}}]	Example	18	83	default
84	74	json	[{"model": "proyecto.proyecto", "pk": 74, "fields": {"name": "example with ambito", "dificultad": 2, "influencia": null, "created": "2018-06-11T19:24:40.155Z", "created_by": 1, "state": "borrador", "sector": [1], "ambito": [4], "orientacion": []}}]	example with ambito	18	84	default
85	74	json	[{"model": "proyecto.proyecto", "pk": 74, "fields": {"name": "example with ambito", "dificultad": 2, "influencia": null, "created": "2018-06-11T19:24:40.155Z", "created_by": 1, "state": "revisado", "sector": [1], "ambito": [4], "orientacion": []}}]	example with ambito	18	85	default
86	73	json	[{"model": "proyecto.proyecto", "pk": 73, "fields": {"name": "Sector y nivel", "dificultad": 1, "influencia": null, "created": "2018-06-11T19:10:30.972Z", "created_by": 1, "state": "revisado", "sector": [1, 2], "ambito": [], "orientacion": []}}]	Sector y nivel	18	86	default
87	73	json	[{"model": "proyecto.proyecto", "pk": 73, "fields": {"name": "Sector y nivel", "resumen": "", "abstract": "", "justificacion": "", "objetivos": "", "metas": "", "inicio": null, "fin": null, "dificultad": 1, "influencia": null, "created": "2018-06-11T19:10:30.972Z", "created_by": 1, "state": "borrador", "sector": [1, 2], "ambito": [], "orientacion": []}}]	Sector y nivel	18	87	default
88	74	json	[{"model": "proyecto.proyecto", "pk": 74, "fields": {"name": "example with ambito", "grupo": null, "resumen": "", "abstract": "", "justificacion": "", "objetivos": "", "metas": "", "inicio": "2018-06-27", "fin": null, "dificultad": 2, "influencia": null, "principal": 1, "created": "2018-06-11T19:24:40.155Z", "created_by": 1, "state": "revisado", "documentos": [], "hitos": [], "sector": [1], "ambito": [4], "orientacion": [], "investigadores": []}}]	example with ambito	18	88	default
102	2	json	[{"model": "proyecto.documento", "pk": 2, "fields": {"title": "Articulo", "descripcion": "<p>dasdasdas</p>", "file": "", "proyecto": 77}}]	Articulo	25	101	default
89	74	json	[{"model": "proyecto.proyecto", "pk": 74, "fields": {"name": "example with ambito", "grupo": null, "resumen": "<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\\r\\n<p>&nbsp;</p>", "abstract": "", "justificacion": "", "objetivos": "", "metas": "", "inicio": "2018-06-27", "fin": null, "dificultad": 2, "influencia": null, "principal": 1, "created": "2018-06-11T19:24:40.155Z", "created_by": 1, "state": "revisado", "documentos": [], "hitos": [], "sector": [1], "ambito": [4], "orientacion": [], "investigadores": []}}]	example with ambito	18	89	default
90	74	json	[{"model": "proyecto.proyecto", "pk": 74, "fields": {"name": "example with ambito", "grupo": 1, "resumen": "<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\\r\\n<p>&nbsp;</p>", "abstract": "", "justificacion": "", "objetivos": "", "metas": "", "inicio": "2018-06-27", "fin": null, "dificultad": 2, "influencia": null, "principal": 1, "created": "2018-06-11T19:24:40.155Z", "created_by": 1, "state": "revisado", "documentos": [], "hitos": [], "sector": [1], "ambito": [4], "orientacion": [], "investigadores": []}}]	example with ambito	18	90	default
91	74	json	[{"model": "proyecto.proyecto", "pk": 74, "fields": {"name": "example with ambito", "grupo": 1, "resumen": "<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\\r\\n<p>&nbsp;</p>", "abstract": "", "justificacion": "", "objetivos": "", "metas": "", "inicio": "2018-06-27", "fin": null, "dificultad": 2, "influencia": null, "principal": 1, "created": "2018-06-11T19:24:40.155Z", "created_by": 1, "state": "revisado", "documentos": [], "hitos": [2], "sector": [1], "ambito": [4], "orientacion": [], "investigadores": []}}]	example with ambito	18	91	default
92	74	json	[{"model": "proyecto.proyecto", "pk": 74, "fields": {"name": "example with ambito", "grupo": 1, "resumen": "<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\\r\\n<p>&nbsp;</p>", "abstract": "", "justificacion": "", "objetivos": "", "metas": "", "inicio": "2018-06-27", "fin": null, "dificultad": 2, "influencia": null, "principal": 1, "created": "2018-06-11T19:24:40.155Z", "created_by": 1, "state": "revisado", "documentos": [], "hitos": [2, 3], "sector": [1], "ambito": [4], "orientacion": [], "investigadores": []}}]	example with ambito	18	92	default
93	74	json	[{"model": "proyecto.proyecto", "pk": 74, "fields": {"name": "example with ambito", "grupo": 1, "resumen": "<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\\r\\n<p>&nbsp;</p>", "abstract": "", "justificacion": "", "objetivos": "", "metas": "", "inicio": "2018-06-27", "fin": null, "dificultad": 2, "influencia": null, "principal": 1, "created": "2018-06-11T19:24:40.155Z", "created_by": 1, "state": "revisado", "documentos": [], "hitos": [2, 3], "sector": [1], "ambito": [4], "orientacion": [], "investigadores": [1]}}]	example with ambito	18	93	default
94	74	json	[{"model": "proyecto.proyecto", "pk": 74, "fields": {"name": "example with ambito", "grupo": 1, "resumen": "<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\\r\\n<p>&nbsp;</p>", "abstract": "<p>asdasdas</p>", "justificacion": "", "objetivos": "", "metas": "", "inicio": "2018-06-27", "fin": null, "dificultad": 2, "influencia": null, "principal": 1, "created": "2018-06-11T19:24:40.155Z", "created_by": 1, "state": "revisado", "documentos": [], "hitos": [2, 3], "sector": [1], "ambito": [4], "orientacion": [], "investigadores": [1]}}]	example with ambito	18	94	default
95	75	json	[{"model": "proyecto.proyecto", "pk": 75, "fields": {"name": "Example", "grupo": null, "resumen": "", "abstract": "", "justificacion": "", "objetivos": "", "metas": "", "inicio": null, "fin": null, "dificultad": 1, "influencia": 1, "principal": 1, "created": "2018-06-11T19:28:36.189Z", "created_by": 1, "state": "borrador", "documentos": [], "hitos": [], "sector": [2], "ambito": [6], "orientacion": [1], "investigadores": []}}]	Example	18	95	default
103	77	json	[{"model": "proyecto.proyecto", "pk": 77, "fields": {"name": "Example", "grupo": null, "resumen": "", "abstract": "", "justificacion": "", "objetivos": "", "metas": "", "inicio": null, "fin": null, "dificultad": null, "influencia": null, "principal": 2, "created": "2018-06-17T19:43:32.410Z", "created_by": 1, "state": "borrador", "hitos": [], "sector": [], "ambito": [], "orientacion": [], "investigadores": []}}]	Example	18	102	default
104	2	json	[{"model": "proyecto.documento", "pk": 2, "fields": {"title": "Articulo", "descripcion": "<p>dasdasdas</p>", "file": "uploads/propiedad-intelectual.pdf", "proyecto": 77}}]	Articulo	25	102	default
96	76	json	[{"model": "proyecto.proyecto", "pk": 76, "fields": {"name": "Este eds un demo", "grupo": 2, "resumen": "<p><span id=\\"docs-internal-guid-b1d1c95d-f6b4-4c29-3fd0-9cf83a68ce6b\\"><span>La fundaci&oacute;n Universitaria los Libertadores viene adelantando desde el a&ntilde;o &hellip;&hellip;. diferentes l&iacute;neas de investigaci&oacute;n agrupadas en semilleros, estos a su vez tienen grupos encargados de adelantar, proponer y mejorar los diferentes proyectos de investigaci&oacute;n de la universidad. En la actualidad los proyectos est&aacute;n supervisados por los profesores, y el avance est&aacute; en su mayor&iacute;a en f&iacute;sico, este proyecto busca generar una herramienta para el control, socializaci&oacute;n y almacenamiento de la informaci&oacute;n relevante de los proyectos.</span></span></p>", "abstract": "", "justificacion": "<p dir=\\"ltr\\"><span>Para este proyecto la poblaci&oacute;n objetivo es la comunidad acad&eacute;mica de la fundaci&oacute;n universitaria los libertadores</span></p>\\r\\n<p><span>&nbsp;</span></p>", "objetivos": "<ol>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Generar un inventario de los proyecto de investigaci&oacute;n activos de la FULL.</span></p>\\r\\n</li>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Estudiar el avance investigativo de la universidad durante el tiempo.</span></p>\\r\\n</li>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Motivar y reconocer a los j&oacute;venes investigadores de la FULL</span></p>\\r\\n</li>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Apoyar los proyectos de investigaci&oacute;n.</span></p>\\r\\n</li>\\r\\n</ol>", "metas": "", "inicio": "2018-02-01", "fin": "2018-06-30", "dificultad": 1, "influencia": 2, "principal": 2, "created": "2018-06-13T01:16:00.955Z", "created_by": 1, "state": "borrador", "documentos": [], "hitos": [4], "sector": [2], "ambito": [6], "orientacion": [1], "investigadores": []}}]	Este eds un demo	18	96	default
97	76	json	[{"model": "proyecto.proyecto", "pk": 76, "fields": {"name": "Este eds un demo", "grupo": 2, "resumen": "<p><span id=\\"docs-internal-guid-b1d1c95d-f6b4-4c29-3fd0-9cf83a68ce6b\\"><span>La fundaci&oacute;n Universitaria los Libertadores viene adelantando desde el a&ntilde;o &hellip;&hellip;. diferentes l&iacute;neas de investigaci&oacute;n agrupadas en semilleros, estos a su vez tienen grupos encargados de adelantar, proponer y mejorar los diferentes proyectos de investigaci&oacute;n de la universidad. En la actualidad los proyectos est&aacute;n supervisados por los profesores, y el avance est&aacute; en su mayor&iacute;a en f&iacute;sico, este proyecto busca generar una herramienta para el control, socializaci&oacute;n y almacenamiento de la informaci&oacute;n relevante de los proyectos.</span></span></p>", "abstract": "", "justificacion": "<p dir=\\"ltr\\"><span>Para este proyecto la poblaci&oacute;n objetivo es la comunidad acad&eacute;mica de la fundaci&oacute;n universitaria los libertadores</span></p>\\r\\n<p><span>&nbsp;</span></p>", "objetivos": "<ol>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Generar un inventario de los proyecto de investigaci&oacute;n activos de la FULL.</span></p>\\r\\n</li>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Estudiar el avance investigativo de la universidad durante el tiempo.</span></p>\\r\\n</li>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Motivar y reconocer a los j&oacute;venes investigadores de la FULL</span></p>\\r\\n</li>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Apoyar los proyectos de investigaci&oacute;n.</span></p>\\r\\n</li>\\r\\n</ol>", "metas": "", "inicio": "2018-02-01", "fin": "2018-06-30", "dificultad": 1, "influencia": 2, "principal": 2, "created": "2018-06-13T01:16:00.955Z", "created_by": 1, "state": "revisado", "documentos": [], "hitos": [4], "sector": [2], "ambito": [6], "orientacion": [1], "investigadores": []}}]	Este eds un demo	18	97	default
98	76	json	[{"model": "proyecto.proyecto", "pk": 76, "fields": {"name": "Este eds un demo", "grupo": 2, "resumen": "<p><span id=\\"docs-internal-guid-b1d1c95d-f6b4-4c29-3fd0-9cf83a68ce6b\\"><span>La fundaci&oacute;n Universitaria los Libertadores viene adelantando desde el a&ntilde;o &hellip;&hellip;. diferentes l&iacute;neas de investigaci&oacute;n agrupadas en semilleros, estos a su vez tienen grupos encargados de adelantar, proponer y mejorar los diferentes proyectos de investigaci&oacute;n de la universidad. En la actualidad los proyectos est&aacute;n supervisados por los profesores, y el avance est&aacute; en su mayor&iacute;a en f&iacute;sico, este proyecto busca generar una herramienta para el control, socializaci&oacute;n y almacenamiento de la informaci&oacute;n relevante de los proyectos.</span></span></p>", "abstract": "<p>asdasdas</p>\\r\\n<p>\\\\asdasdas</p>\\r\\n<p>adsdasd</p>\\r\\n<p>as</p>", "justificacion": "<p dir=\\"ltr\\"><span>Para este proyecto la poblaci&oacute;n objetivo es la comunidad acad&eacute;mica de la fundaci&oacute;n universitaria los libertadores</span></p>\\r\\n<p><span>&nbsp;</span></p>", "objetivos": "<ol>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Generar un inventario de los proyecto de investigaci&oacute;n activos de la FULL.</span></p>\\r\\n</li>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Estudiar el avance investigativo de la universidad durante el tiempo.</span></p>\\r\\n</li>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Motivar y reconocer a los j&oacute;venes investigadores de la FULL</span></p>\\r\\n</li>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Apoyar los proyectos de investigaci&oacute;n.</span></p>\\r\\n</li>\\r\\n</ol>", "metas": "<p>asdasd</p>\\r\\n<p>asd</p>\\r\\n<p>sadas</p>", "inicio": "2018-02-01", "fin": "2018-06-30", "dificultad": 1, "influencia": 2, "principal": 2, "created": "2018-06-13T01:16:00.955Z", "created_by": 1, "state": "revisado", "documentos": [], "hitos": [4], "sector": [2], "ambito": [6], "orientacion": [1], "investigadores": []}}]	Este eds un demo	18	98	default
99	76	json	[{"model": "proyecto.proyecto", "pk": 76, "fields": {"name": "Este eds un demo", "grupo": 2, "resumen": "<p><span id=\\"docs-internal-guid-b1d1c95d-f6b4-4c29-3fd0-9cf83a68ce6b\\"><span>La fundaci&oacute;n Universitaria los Libertadores viene adelantando desde el a&ntilde;o &hellip;&hellip;. diferentes l&iacute;neas de investigaci&oacute;n agrupadas en semilleros, estos a su vez tienen grupos encargados de adelantar, proponer y mejorar los diferentes proyectos de investigaci&oacute;n de la universidad. En la actualidad los proyectos est&aacute;n supervisados por los profesores, y el avance est&aacute; en su mayor&iacute;a en f&iacute;sico, este proyecto busca generar una herramienta para el control, socializaci&oacute;n y almacenamiento de la informaci&oacute;n relevante de los proyectos.</span></span></p>", "abstract": "<p>asdasdas</p>\\r\\n<p>\\\\asdasdas</p>\\r\\n<p>adsdasd</p>\\r\\n<p>as</p>", "justificacion": "<p dir=\\"ltr\\"><span>Para este proyecto la poblaci&oacute;n objetivo es la comunidad acad&eacute;mica de la fundaci&oacute;n universitaria los libertadores</span></p>\\r\\n<p><span>&nbsp;</span></p>", "objetivos": "<ol>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Generar un inventario de los proyecto de investigaci&oacute;n activos de la FULL.</span></p>\\r\\n</li>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Estudiar el avance investigativo de la universidad durante el tiempo.</span></p>\\r\\n</li>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Motivar y reconocer a los j&oacute;venes investigadores de la FULL</span></p>\\r\\n</li>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Apoyar los proyectos de investigaci&oacute;n.</span></p>\\r\\n</li>\\r\\n</ol>", "metas": "<p>asdasd</p>\\r\\n<p>asd</p>\\r\\n<p>sadas</p>", "inicio": "2018-02-01", "fin": "2018-06-30", "dificultad": 1, "influencia": 2, "principal": 2, "created": "2018-06-13T01:16:00.955Z", "created_by": 1, "state": "revisado", "documentos": [], "hitos": [4], "sector": [2], "ambito": [6], "orientacion": [1], "investigadores": []}}]	Este eds un demo	18	99	default
100	76	json	[{"model": "proyecto.proyecto", "pk": 76, "fields": {"name": "Este eds un demo", "grupo": 2, "resumen": "<p><span id=\\"docs-internal-guid-b1d1c95d-f6b4-4c29-3fd0-9cf83a68ce6b\\"><span>La fundaci&oacute;n Universitaria los Libertadores viene adelantando desde el a&ntilde;o &hellip;&hellip;. diferentes l&iacute;neas de investigaci&oacute;n agrupadas en semilleros, estos a su vez tienen grupos encargados de adelantar, proponer y mejorar los diferentes proyectos de investigaci&oacute;n de la universidad. En la actualidad los proyectos est&aacute;n supervisados por los profesores, y el avance est&aacute; en su mayor&iacute;a en f&iacute;sico, este proyecto busca generar una herramienta para el control, socializaci&oacute;n y almacenamiento de la informaci&oacute;n relevante de los proyectos.</span></span></p>", "abstract": "<p>asdasdas</p>\\r\\n<p>\\\\asdasdas</p>\\r\\n<p>adsdasd</p>\\r\\n<p>as</p>", "justificacion": "<p dir=\\"ltr\\"><span>Para este proyecto la poblaci&oacute;n objetivo es la comunidad acad&eacute;mica de la fundaci&oacute;n universitaria los libertadores</span></p>\\r\\n<p><span>&nbsp;</span></p>", "objetivos": "<ol>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Generar un inventario de los proyecto de investigaci&oacute;n activos de la FULL.</span></p>\\r\\n</li>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Estudiar el avance investigativo de la universidad durante el tiempo.</span></p>\\r\\n</li>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Motivar y reconocer a los j&oacute;venes investigadores de la FULL</span></p>\\r\\n</li>\\r\\n<li dir=\\"ltr\\">\\r\\n<p dir=\\"ltr\\"><span>Apoyar los proyectos de investigaci&oacute;n.</span></p>\\r\\n</li>\\r\\n</ol>", "metas": "<p>asdasd</p>\\r\\n<p>asd</p>\\r\\n<p>sadas</p>", "inicio": "2018-02-01", "fin": "2018-06-30", "dificultad": 1, "influencia": 2, "principal": 2, "created": "2018-06-13T01:16:00.955Z", "created_by": 1, "state": "revisado", "documentos": [], "hitos": [4], "sector": [2], "ambito": [6], "orientacion": [1], "investigadores": []}}]	Este eds un demo	18	100	default
101	77	json	[{"model": "proyecto.proyecto", "pk": 77, "fields": {"name": "Example", "grupo": null, "resumen": "", "abstract": "", "justificacion": "", "objetivos": "", "metas": "", "inicio": null, "fin": null, "dificultad": null, "influencia": null, "principal": 2, "created": "2018-06-17T19:43:32.410Z", "created_by": 1, "state": "borrador", "hitos": [], "sector": [], "ambito": [], "orientacion": [], "investigadores": []}}]	Example	18	101	default
105	74	json	[{"model": "proyecto.proyecto", "pk": 74, "fields": {"name": "example with ambito", "grupo": 1, "resumen": "<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\\r\\n<p>&nbsp;</p>", "abstract": "<p>asdasdas</p>", "justificacion": "", "objetivos": "", "metas": "", "inicio": "2018-06-27", "fin": null, "dificultad": 2, "influencia": null, "principal": 1, "created": "2018-06-11T19:24:40.155Z", "created_by": 1, "state": "revisado", "sector": [1], "ambito": [4], "orientacion": [], "investigadores": [1]}}]	example with ambito	18	103	default
106	3	json	[{"model": "proyecto.documento", "pk": 3, "fields": {"title": "EXAMPE", "descripcion": "", "file": "", "proyecto": 74}}]	EXAMPE	25	103	default
107	78	json	[{"model": "proyecto.proyecto", "pk": 78, "fields": {"name": "Sistema de riego automatico para jardines", "grupo": 2, "resumen": "<p>Este es un ejemplo de un proyecto asociado al grupo de investigacion GUIAS, este se trata de un sistema automatizado de riesgos.</p>", "abstract": "", "justificacion": "", "objetivos": "", "metas": "", "inicio": "2018-02-01", "fin": "2018-06-30", "dificultad": 2, "influencia": 1, "principal": 2, "created": "2018-06-19T22:58:45.565Z", "created_by": 1, "state": "borrador", "sector": [5], "ambito": [6], "orientacion": [1], "investigadores": [1]}}]	Sistema de riego automatico para jardines	18	104	default
108	5	json	[{"model": "proyecto.hito", "pk": 5, "fields": {"name": "Entrega del proyecto", "descripcion": "", "fecha": "2018-06-28", "proyecto": 78}}]	Entrega del proyecto	24	104	default
109	4	json	[{"model": "proyecto.documento", "pk": 4, "fields": {"title": "Propiedad", "descripcion": "", "file": "uploads/propiedad-intelectual_FAJERLc.pdf", "proyecto": 78}}]	Propiedad	25	104	default
110	78	json	[{"model": "proyecto.proyecto", "pk": 78, "fields": {"name": "Sistema de riego automatico para jardines", "grupo": 2, "resumen": "<p>Este es un ejemplo de un proyecto asociado al grupo de investigacion GUIAS, este se trata de un sistema automatizado de riesgos.</p>", "abstract": "", "justificacion": "", "objetivos": "", "metas": "", "inicio": "2018-02-01", "fin": "2018-06-30", "dificultad": 2, "influencia": 1, "principal": 2, "created": "2018-06-19T22:58:45.565Z", "created_by": 1, "state": "revisado", "sector": [5], "ambito": [6], "orientacion": [1], "investigadores": [1]}}]	Sistema de riego automatico para jardines	18	105	default
111	5	json	[{"model": "proyecto.hito", "pk": 5, "fields": {"name": "Entrega del proyecto", "descripcion": "", "fecha": "2018-06-28", "proyecto": 78}}]	Entrega del proyecto	24	105	default
112	4	json	[{"model": "proyecto.documento", "pk": 4, "fields": {"title": "Propiedad", "descripcion": "", "file": "uploads/propiedad-intelectual_FAJERLc.pdf", "proyecto": 78}}]	Propiedad	25	105	default
113	78	json	[{"model": "proyecto.proyecto", "pk": 78, "fields": {"name": "Sistema de riego automatico para jardines", "grupo": 2, "resumen": "<p>Este es un ejemplo de un proyecto asociado al grupo de investigacion GUIAS, este se trata de un sistema automatizado de riesgos.</p>", "abstract": "", "justificacion": "", "objetivos": "", "metas": "", "inicio": "2018-02-01", "fin": "2018-06-30", "dificultad": 2, "influencia": 1, "principal": 2, "created": "2018-06-19T22:58:45.565Z", "created_by": 1, "state": "publicado", "sector": [5], "ambito": [6], "orientacion": [1], "investigadores": [1]}}]	Sistema de riego automatico para jardines	18	106	default
114	5	json	[{"model": "proyecto.hito", "pk": 5, "fields": {"name": "Entrega del proyecto", "descripcion": "", "fecha": "2018-06-28", "proyecto": 78}}]	Entrega del proyecto	24	106	default
115	4	json	[{"model": "proyecto.documento", "pk": 4, "fields": {"title": "Propiedad", "descripcion": "", "file": "uploads/propiedad-intelectual_FAJERLc.pdf", "proyecto": 78}}]	Propiedad	25	106	default
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, name) FROM stdin;
2	argon2$argon2i$v=19$m=512,t=2,p=2$OEpIRGtJRGVvU0JE$wLykxG+kzD8eMh69P8vbNA	\N	t	cgila	Celio Gil			t	t	2018-06-13 01:12:47+00	Celio Gil
1	argon2$argon2i$v=19$m=512,t=2,p=2$UlQ4MllPaFJmelAy$VUtfAF57zjpCJyPoulLbIQ	2018-06-22 01:49:31.819912+00	t	admin			admin@ejempli.com	t	t	2018-06-06 21:10:56+00	Sergio Vargas
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: svargas
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	1	55
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 112, true);


--
-- Name: dashboard_userdashboardmodule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.dashboard_userdashboardmodule_id_seq', 41, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 303, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 58, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 280, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, false);


--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.jet_bookmark_id_seq', 1, false);


--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.jet_pinnedapplication_id_seq', 1, false);


--
-- Name: proyecto_ambito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.proyecto_ambito_id_seq', 6, true);


--
-- Name: proyecto_dificultad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.proyecto_dificultad_id_seq', 5, true);


--
-- Name: proyecto_documento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.proyecto_documento_id_seq', 4, true);


--
-- Name: proyecto_grupo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.proyecto_grupo_id_seq', 2, true);


--
-- Name: proyecto_hitos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.proyecto_hitos_id_seq', 5, true);


--
-- Name: proyecto_influencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.proyecto_influencia_id_seq', 2, true);


--
-- Name: proyecto_orientacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.proyecto_orientacion_id_seq', 1, true);


--
-- Name: proyecto_proyecto_ambito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.proyecto_proyecto_ambito_id_seq', 6, true);


--
-- Name: proyecto_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.proyecto_proyecto_id_seq', 78, true);


--
-- Name: proyecto_proyecto_investigadores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.proyecto_proyecto_investigadores_id_seq', 2, true);


--
-- Name: proyecto_proyecto_orientacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.proyecto_proyecto_orientacion_id_seq', 5, true);


--
-- Name: proyecto_proyecto_sector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.proyecto_proyecto_sector_id_seq', 9, true);


--
-- Name: proyecto_sector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.proyecto_sector_id_seq', 5, true);


--
-- Name: reversion_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.reversion_revision_id_seq', 106, true);


--
-- Name: reversion_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.reversion_version_id_seq', 115, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: svargas
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 33, true);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: dashboard_userdashboardmodule dashboard_userdashboardmodule_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.dashboard_userdashboardmodule
    ADD CONSTRAINT dashboard_userdashboardmodule_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: jet_bookmark jet_bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.jet_bookmark
    ADD CONSTRAINT jet_bookmark_pkey PRIMARY KEY (id);


--
-- Name: jet_pinnedapplication jet_pinnedapplication_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.jet_pinnedapplication
    ADD CONSTRAINT jet_pinnedapplication_pkey PRIMARY KEY (id);


--
-- Name: proyecto_ambito proyecto_ambito_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_ambito
    ADD CONSTRAINT proyecto_ambito_pkey PRIMARY KEY (id);


--
-- Name: proyecto_dificultad proyecto_dificultad_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_dificultad
    ADD CONSTRAINT proyecto_dificultad_pkey PRIMARY KEY (id);


--
-- Name: proyecto_documento proyecto_documento_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_documento
    ADD CONSTRAINT proyecto_documento_pkey PRIMARY KEY (id);


--
-- Name: proyecto_grupo proyecto_grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_grupo
    ADD CONSTRAINT proyecto_grupo_pkey PRIMARY KEY (id);


--
-- Name: proyecto_hito proyecto_hitos_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_hito
    ADD CONSTRAINT proyecto_hitos_pkey PRIMARY KEY (id);


--
-- Name: proyecto_influencia proyecto_influencia_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_influencia
    ADD CONSTRAINT proyecto_influencia_pkey PRIMARY KEY (id);


--
-- Name: proyecto_orientacion proyecto_orientacion_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_orientacion
    ADD CONSTRAINT proyecto_orientacion_pkey PRIMARY KEY (id);


--
-- Name: proyecto_proyecto_ambito proyecto_proyecto_ambito_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_ambito
    ADD CONSTRAINT proyecto_proyecto_ambito_pkey PRIMARY KEY (id);


--
-- Name: proyecto_proyecto_ambito proyecto_proyecto_ambito_proyecto_id_ambito_id_7b5c1e6a_uniq; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_ambito
    ADD CONSTRAINT proyecto_proyecto_ambito_proyecto_id_ambito_id_7b5c1e6a_uniq UNIQUE (proyecto_id, ambito_id);


--
-- Name: proyecto_proyecto_investigadores proyecto_proyecto_invest_proyecto_id_user_id_56304049_uniq; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_investigadores
    ADD CONSTRAINT proyecto_proyecto_invest_proyecto_id_user_id_56304049_uniq UNIQUE (proyecto_id, user_id);


--
-- Name: proyecto_proyecto_investigadores proyecto_proyecto_investigadores_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_investigadores
    ADD CONSTRAINT proyecto_proyecto_investigadores_pkey PRIMARY KEY (id);


--
-- Name: proyecto_proyecto_orientacion proyecto_proyecto_orient_proyecto_id_orientacion__9acfc921_uniq; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_orientacion
    ADD CONSTRAINT proyecto_proyecto_orient_proyecto_id_orientacion__9acfc921_uniq UNIQUE (proyecto_id, orientacion_id);


--
-- Name: proyecto_proyecto_orientacion proyecto_proyecto_orientacion_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_orientacion
    ADD CONSTRAINT proyecto_proyecto_orientacion_pkey PRIMARY KEY (id);


--
-- Name: proyecto_proyecto proyecto_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto
    ADD CONSTRAINT proyecto_proyecto_pkey PRIMARY KEY (id);


--
-- Name: proyecto_proyecto_sector proyecto_proyecto_sector_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_sector
    ADD CONSTRAINT proyecto_proyecto_sector_pkey PRIMARY KEY (id);


--
-- Name: proyecto_proyecto_sector proyecto_proyecto_sector_proyecto_id_sector_id_e2dbdc82_uniq; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_sector
    ADD CONSTRAINT proyecto_proyecto_sector_proyecto_id_sector_id_e2dbdc82_uniq UNIQUE (proyecto_id, sector_id);


--
-- Name: proyecto_sector proyecto_sector_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_sector
    ADD CONSTRAINT proyecto_sector_pkey PRIMARY KEY (id);


--
-- Name: reversion_revision reversion_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.reversion_revision
    ADD CONSTRAINT reversion_revision_pkey PRIMARY KEY (id);


--
-- Name: reversion_version reversion_version_db_content_type_id_objec_b2c54f65_uniq; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.reversion_version
    ADD CONSTRAINT reversion_version_db_content_type_id_objec_b2c54f65_uniq UNIQUE (db, content_type_id, object_id, revision_id);


--
-- Name: reversion_version reversion_version_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.reversion_version
    ADD CONSTRAINT reversion_version_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: proyecto_documento_proyecto_id_f0ce3914; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX proyecto_documento_proyecto_id_f0ce3914 ON public.proyecto_documento USING btree (proyecto_id);


--
-- Name: proyecto_grupo_lider_id_9ebfb126; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX proyecto_grupo_lider_id_9ebfb126 ON public.proyecto_grupo USING btree (lider_id);


--
-- Name: proyecto_hito_proyecto_id_0709fa20; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX proyecto_hito_proyecto_id_0709fa20 ON public.proyecto_hito USING btree (proyecto_id);


--
-- Name: proyecto_proyecto_ambito_ambito_id_38028cee; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX proyecto_proyecto_ambito_ambito_id_38028cee ON public.proyecto_proyecto_ambito USING btree (ambito_id);


--
-- Name: proyecto_proyecto_ambito_proyecto_id_6cef07a8; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX proyecto_proyecto_ambito_proyecto_id_6cef07a8 ON public.proyecto_proyecto_ambito USING btree (proyecto_id);


--
-- Name: proyecto_proyecto_created_by_id_7f5a8787; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX proyecto_proyecto_created_by_id_7f5a8787 ON public.proyecto_proyecto USING btree (created_by_id);


--
-- Name: proyecto_proyecto_dificultad_id_55707144; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX proyecto_proyecto_dificultad_id_55707144 ON public.proyecto_proyecto USING btree (dificultad_id);


--
-- Name: proyecto_proyecto_grupo_id_06ff86eb; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX proyecto_proyecto_grupo_id_06ff86eb ON public.proyecto_proyecto USING btree (grupo_id);


--
-- Name: proyecto_proyecto_influencia_id_338c4e8c; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX proyecto_proyecto_influencia_id_338c4e8c ON public.proyecto_proyecto USING btree (influencia_id);


--
-- Name: proyecto_proyecto_investigadores_proyecto_id_2d4946f5; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX proyecto_proyecto_investigadores_proyecto_id_2d4946f5 ON public.proyecto_proyecto_investigadores USING btree (proyecto_id);


--
-- Name: proyecto_proyecto_investigadores_user_id_5b410c45; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX proyecto_proyecto_investigadores_user_id_5b410c45 ON public.proyecto_proyecto_investigadores USING btree (user_id);


--
-- Name: proyecto_proyecto_orientacion_orientacion_id_006ff84b; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX proyecto_proyecto_orientacion_orientacion_id_006ff84b ON public.proyecto_proyecto_orientacion USING btree (orientacion_id);


--
-- Name: proyecto_proyecto_orientacion_proyecto_id_d8692e8d; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX proyecto_proyecto_orientacion_proyecto_id_d8692e8d ON public.proyecto_proyecto_orientacion USING btree (proyecto_id);


--
-- Name: proyecto_proyecto_principal_id_b22d7e86; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX proyecto_proyecto_principal_id_b22d7e86 ON public.proyecto_proyecto USING btree (principal_id);


--
-- Name: proyecto_proyecto_sector_proyecto_id_039e414b; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX proyecto_proyecto_sector_proyecto_id_039e414b ON public.proyecto_proyecto_sector USING btree (proyecto_id);


--
-- Name: proyecto_proyecto_sector_sector_id_13e8e24c; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX proyecto_proyecto_sector_sector_id_13e8e24c ON public.proyecto_proyecto_sector USING btree (sector_id);


--
-- Name: reversion_revision_date_created_96f7c20c; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX reversion_revision_date_created_96f7c20c ON public.reversion_revision USING btree (date_created);


--
-- Name: reversion_revision_user_id_17095f45; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX reversion_revision_user_id_17095f45 ON public.reversion_revision USING btree (user_id);


--
-- Name: reversion_version_content_type_id_7d0ff25c; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX reversion_version_content_type_id_7d0ff25c ON public.reversion_version USING btree (content_type_id);


--
-- Name: reversion_version_revision_id_af9f6a9d; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX reversion_version_revision_id_af9f6a9d ON public.reversion_version USING btree (revision_id);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: svargas
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proyecto_documento proyecto_documento_proyecto_id_f0ce3914_fk_proyecto_proyecto_id; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_documento
    ADD CONSTRAINT proyecto_documento_proyecto_id_f0ce3914_fk_proyecto_proyecto_id FOREIGN KEY (proyecto_id) REFERENCES public.proyecto_proyecto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proyecto_grupo proyecto_grupo_lider_id_9ebfb126_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_grupo
    ADD CONSTRAINT proyecto_grupo_lider_id_9ebfb126_fk_users_user_id FOREIGN KEY (lider_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proyecto_hito proyecto_hito_proyecto_id_0709fa20_fk_proyecto_proyecto_id; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_hito
    ADD CONSTRAINT proyecto_hito_proyecto_id_0709fa20_fk_proyecto_proyecto_id FOREIGN KEY (proyecto_id) REFERENCES public.proyecto_proyecto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proyecto_proyecto_ambito proyecto_proyecto_am_ambito_id_38028cee_fk_proyecto_; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_ambito
    ADD CONSTRAINT proyecto_proyecto_am_ambito_id_38028cee_fk_proyecto_ FOREIGN KEY (ambito_id) REFERENCES public.proyecto_ambito(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proyecto_proyecto_ambito proyecto_proyecto_am_proyecto_id_6cef07a8_fk_proyecto_; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_ambito
    ADD CONSTRAINT proyecto_proyecto_am_proyecto_id_6cef07a8_fk_proyecto_ FOREIGN KEY (proyecto_id) REFERENCES public.proyecto_proyecto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proyecto_proyecto proyecto_proyecto_created_by_id_7f5a8787_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto
    ADD CONSTRAINT proyecto_proyecto_created_by_id_7f5a8787_fk_users_user_id FOREIGN KEY (created_by_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proyecto_proyecto proyecto_proyecto_dificultad_id_55707144_fk_proyecto_; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto
    ADD CONSTRAINT proyecto_proyecto_dificultad_id_55707144_fk_proyecto_ FOREIGN KEY (dificultad_id) REFERENCES public.proyecto_dificultad(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proyecto_proyecto proyecto_proyecto_grupo_id_06ff86eb_fk_proyecto_grupo_id; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto
    ADD CONSTRAINT proyecto_proyecto_grupo_id_06ff86eb_fk_proyecto_grupo_id FOREIGN KEY (grupo_id) REFERENCES public.proyecto_grupo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proyecto_proyecto_investigadores proyecto_proyecto_in_proyecto_id_2d4946f5_fk_proyecto_; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_investigadores
    ADD CONSTRAINT proyecto_proyecto_in_proyecto_id_2d4946f5_fk_proyecto_ FOREIGN KEY (proyecto_id) REFERENCES public.proyecto_proyecto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proyecto_proyecto_investigadores proyecto_proyecto_in_user_id_5b410c45_fk_users_use; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_investigadores
    ADD CONSTRAINT proyecto_proyecto_in_user_id_5b410c45_fk_users_use FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proyecto_proyecto proyecto_proyecto_influencia_id_338c4e8c_fk_proyecto_; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto
    ADD CONSTRAINT proyecto_proyecto_influencia_id_338c4e8c_fk_proyecto_ FOREIGN KEY (influencia_id) REFERENCES public.proyecto_influencia(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proyecto_proyecto_orientacion proyecto_proyecto_or_orientacion_id_006ff84b_fk_proyecto_; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_orientacion
    ADD CONSTRAINT proyecto_proyecto_or_orientacion_id_006ff84b_fk_proyecto_ FOREIGN KEY (orientacion_id) REFERENCES public.proyecto_orientacion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proyecto_proyecto_orientacion proyecto_proyecto_or_proyecto_id_d8692e8d_fk_proyecto_; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_orientacion
    ADD CONSTRAINT proyecto_proyecto_or_proyecto_id_d8692e8d_fk_proyecto_ FOREIGN KEY (proyecto_id) REFERENCES public.proyecto_proyecto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proyecto_proyecto proyecto_proyecto_principal_id_b22d7e86_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto
    ADD CONSTRAINT proyecto_proyecto_principal_id_b22d7e86_fk_users_user_id FOREIGN KEY (principal_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proyecto_proyecto_sector proyecto_proyecto_se_proyecto_id_039e414b_fk_proyecto_; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_sector
    ADD CONSTRAINT proyecto_proyecto_se_proyecto_id_039e414b_fk_proyecto_ FOREIGN KEY (proyecto_id) REFERENCES public.proyecto_proyecto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: proyecto_proyecto_sector proyecto_proyecto_se_sector_id_13e8e24c_fk_proyecto_; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.proyecto_proyecto_sector
    ADD CONSTRAINT proyecto_proyecto_se_sector_id_13e8e24c_fk_proyecto_ FOREIGN KEY (sector_id) REFERENCES public.proyecto_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_revision reversion_revision_user_id_17095f45_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.reversion_revision
    ADD CONSTRAINT reversion_revision_user_id_17095f45_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_version reversion_version_content_type_id_7d0ff25c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.reversion_version
    ADD CONSTRAINT reversion_version_content_type_id_7d0ff25c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_version reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.reversion_version
    ADD CONSTRAINT reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id FOREIGN KEY (revision_id) REFERENCES public.reversion_revision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: svargas
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

