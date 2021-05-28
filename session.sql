--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ubuntu;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ubuntu;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ubuntu;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ubuntu;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ubuntu;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ubuntu;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO ubuntu;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO ubuntu;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO ubuntu;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO ubuntu;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO ubuntu;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO ubuntu;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: cms_aboutus_information; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_aboutus_information (
    id integer NOT NULL,
    name character varying(300) NOT NULL,
    description text NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.cms_aboutus_information OWNER TO ubuntu;

--
-- Name: cms_aboutus_information_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_aboutus_information_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_aboutus_information_id_seq OWNER TO ubuntu;

--
-- Name: cms_aboutus_information_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_aboutus_information_id_seq OWNED BY public.cms_aboutus_information.id;


--
-- Name: cms_available; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_available (
    id integer NOT NULL,
    product_id integer,
    vendor_id integer
);


ALTER TABLE public.cms_available OWNER TO ubuntu;

--
-- Name: cms_available_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_available_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_available_id_seq OWNER TO ubuntu;

--
-- Name: cms_available_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_available_id_seq OWNED BY public.cms_available.id;


--
-- Name: cms_benifits; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_benifits (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.cms_benifits OWNER TO ubuntu;

--
-- Name: cms_benifits_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_benifits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_benifits_id_seq OWNER TO ubuntu;

--
-- Name: cms_benifits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_benifits_id_seq OWNED BY public.cms_benifits.id;


--
-- Name: cms_category; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_category (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    url_slug character varying(400),
    image character varying(100) NOT NULL,
    keyword text NOT NULL,
    main_category_id integer
);


ALTER TABLE public.cms_category OWNER TO ubuntu;

--
-- Name: cms_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_category_id_seq OWNER TO ubuntu;

--
-- Name: cms_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_category_id_seq OWNED BY public.cms_category.id;


--
-- Name: cms_contact_us; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_contact_us (
    id integer NOT NULL,
    name character varying(300) NOT NULL,
    message text NOT NULL,
    email character varying(400) NOT NULL,
    phone character varying(100) NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.cms_contact_us OWNER TO ubuntu;

--
-- Name: cms_contact_us_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_contact_us_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_contact_us_id_seq OWNER TO ubuntu;

--
-- Name: cms_contact_us_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_contact_us_id_seq OWNED BY public.cms_contact_us.id;


--
-- Name: cms_employee; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_employee (
    id integer NOT NULL,
    is_verified boolean NOT NULL,
    user_id integer
);


ALTER TABLE public.cms_employee OWNER TO ubuntu;

--
-- Name: cms_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_employee_id_seq OWNER TO ubuntu;

--
-- Name: cms_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_employee_id_seq OWNED BY public.cms_employee.id;


--
-- Name: cms_feature; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_feature (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    product_id integer
);


ALTER TABLE public.cms_feature OWNER TO ubuntu;

--
-- Name: cms_feature_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_feature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_feature_id_seq OWNER TO ubuntu;

--
-- Name: cms_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_feature_id_seq OWNED BY public.cms_feature.id;


--
-- Name: cms_image; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_image (
    id integer NOT NULL,
    image character varying(100),
    product_id integer
);


ALTER TABLE public.cms_image OWNER TO ubuntu;

--
-- Name: cms_image_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_image_id_seq OWNER TO ubuntu;

--
-- Name: cms_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_image_id_seq OWNED BY public.cms_image.id;


--
-- Name: cms_main_category; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_main_category (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    url_slug character varying(400)
);


ALTER TABLE public.cms_main_category OWNER TO ubuntu;

--
-- Name: cms_main_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_main_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_main_category_id_seq OWNER TO ubuntu;

--
-- Name: cms_main_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_main_category_id_seq OWNED BY public.cms_main_category.id;


--
-- Name: cms_offers; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_offers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    url_slug character varying(400),
    image character varying(100) NOT NULL,
    keyword text NOT NULL
);


ALTER TABLE public.cms_offers OWNER TO ubuntu;

--
-- Name: cms_offers_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_offers_id_seq OWNER TO ubuntu;

--
-- Name: cms_offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_offers_id_seq OWNED BY public.cms_offers.id;


--
-- Name: cms_offers_product; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_offers_product (
    id integer NOT NULL,
    offers_id integer,
    product_id integer
);


ALTER TABLE public.cms_offers_product OWNER TO ubuntu;

--
-- Name: cms_offers_product_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_offers_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_offers_product_id_seq OWNER TO ubuntu;

--
-- Name: cms_offers_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_offers_product_id_seq OWNED BY public.cms_offers_product.id;


--
-- Name: cms_product; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_product (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    description text NOT NULL,
    stock boolean NOT NULL,
    brandname character varying(200) NOT NULL,
    actual_price integer NOT NULL,
    price integer NOT NULL,
    is_verified boolean NOT NULL,
    url_slug character varying(400),
    keyword text NOT NULL,
    category_id integer
);


ALTER TABLE public.cms_product OWNER TO ubuntu;

--
-- Name: cms_product_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_product_id_seq OWNER TO ubuntu;

--
-- Name: cms_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_product_id_seq OWNED BY public.cms_product.id;


--
-- Name: cms_question; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_question (
    id integer NOT NULL,
    ques character varying(100) NOT NULL,
    answer text NOT NULL,
    product_id integer
);


ALTER TABLE public.cms_question OWNER TO ubuntu;

--
-- Name: cms_question_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_question_id_seq OWNER TO ubuntu;

--
-- Name: cms_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_question_id_seq OWNED BY public.cms_question.id;


--
-- Name: cms_review; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_review (
    id integer NOT NULL,
    rate integer NOT NULL,
    comment text NOT NULL,
    product_id integer,
    user_id integer
);


ALTER TABLE public.cms_review OWNER TO ubuntu;

--
-- Name: cms_review_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_review_id_seq OWNER TO ubuntu;

--
-- Name: cms_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_review_id_seq OWNED BY public.cms_review.id;


--
-- Name: cms_side_effect; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_side_effect (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    summery text NOT NULL,
    product_id integer
);


ALTER TABLE public.cms_side_effect OWNER TO ubuntu;

--
-- Name: cms_side_effect_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_side_effect_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_side_effect_id_seq OWNER TO ubuntu;

--
-- Name: cms_side_effect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_side_effect_id_seq OWNED BY public.cms_side_effect.id;


--
-- Name: cms_site_information; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_site_information (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text NOT NULL,
    info1 text NOT NULL,
    info2 text NOT NULL,
    address character varying(400) NOT NULL,
    email character varying(400) NOT NULL,
    admin_email character varying(400) NOT NULL,
    image character varying(100) NOT NULL,
    mobile character varying(20) NOT NULL
);


ALTER TABLE public.cms_site_information OWNER TO ubuntu;

--
-- Name: cms_site_information_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_site_information_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_site_information_id_seq OWNER TO ubuntu;

--
-- Name: cms_site_information_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_site_information_id_seq OWNED BY public.cms_site_information.id;


--
-- Name: cms_slider; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_slider (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    button_name character varying(80) NOT NULL,
    url_name character varying(400) NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.cms_slider OWNER TO ubuntu;

--
-- Name: cms_slider_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_slider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_slider_id_seq OWNER TO ubuntu;

--
-- Name: cms_slider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_slider_id_seq OWNED BY public.cms_slider.id;


--
-- Name: cms_terms_and_conditions; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_terms_and_conditions (
    id integer NOT NULL,
    term character varying(400) NOT NULL,
    condition text NOT NULL
);


ALTER TABLE public.cms_terms_and_conditions OWNER TO ubuntu;

--
-- Name: cms_terms_and_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_terms_and_conditions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_terms_and_conditions_id_seq OWNER TO ubuntu;

--
-- Name: cms_terms_and_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_terms_and_conditions_id_seq OWNED BY public.cms_terms_and_conditions.id;


--
-- Name: cms_vendor; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.cms_vendor (
    id integer NOT NULL,
    store character varying(400) NOT NULL,
    license character varying(400) NOT NULL,
    city character varying(200) NOT NULL,
    state character varying(200) NOT NULL,
    zipcode character varying(200) NOT NULL,
    address character varying(320) NOT NULL,
    is_verified boolean NOT NULL,
    summery text NOT NULL,
    user_id integer
);


ALTER TABLE public.cms_vendor OWNER TO ubuntu;

--
-- Name: cms_vendor_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.cms_vendor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_vendor_id_seq OWNER TO ubuntu;

--
-- Name: cms_vendor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.cms_vendor_id_seq OWNED BY public.cms_vendor.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ubuntu
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


ALTER TABLE public.django_admin_log OWNER TO ubuntu;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ubuntu;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ubuntu;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ubuntu;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ubuntu;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ubuntu;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ubuntu;

--
-- Name: prico_cart; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.prico_cart (
    id integer NOT NULL,
    quantity integer NOT NULL,
    product_id integer,
    user_id integer
);


ALTER TABLE public.prico_cart OWNER TO ubuntu;

--
-- Name: prico_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.prico_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prico_cart_id_seq OWNER TO ubuntu;

--
-- Name: prico_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.prico_cart_id_seq OWNED BY public.prico_cart.id;


--
-- Name: prico_customer; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.prico_customer (
    id integer NOT NULL,
    age integer NOT NULL,
    gender character varying(50) NOT NULL,
    user_id integer
);


ALTER TABLE public.prico_customer OWNER TO ubuntu;

--
-- Name: prico_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.prico_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prico_customer_id_seq OWNER TO ubuntu;

--
-- Name: prico_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.prico_customer_id_seq OWNED BY public.prico_customer.id;


--
-- Name: prico_forget_password_otp; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.prico_forget_password_otp (
    id integer NOT NULL,
    otp character varying(10) NOT NULL,
    attempt integer NOT NULL,
    user_id integer
);


ALTER TABLE public.prico_forget_password_otp OWNER TO ubuntu;

--
-- Name: prico_forget_password_otp_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.prico_forget_password_otp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prico_forget_password_otp_id_seq OWNER TO ubuntu;

--
-- Name: prico_forget_password_otp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.prico_forget_password_otp_id_seq OWNED BY public.prico_forget_password_otp.id;


--
-- Name: prico_notification; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.prico_notification (
    id integer NOT NULL,
    subject character varying(400) NOT NULL,
    content text NOT NULL,
    link character varying(200) NOT NULL,
    seen boolean NOT NULL,
    user_id integer,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.prico_notification OWNER TO ubuntu;

--
-- Name: prico_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.prico_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prico_notification_id_seq OWNER TO ubuntu;

--
-- Name: prico_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.prico_notification_id_seq OWNED BY public.prico_notification.id;


--
-- Name: prico_order; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.prico_order (
    id integer NOT NULL,
    uid character varying(60) NOT NULL,
    location character varying(400) NOT NULL,
    zipcode character varying(50) NOT NULL,
    address character varying(400) NOT NULL,
    mobile character varying(22) NOT NULL,
    notes text NOT NULL,
    date timestamp with time zone NOT NULL,
    tolal_tax integer NOT NULL,
    tolal_item_price integer NOT NULL,
    delivery_charge integer NOT NULL,
    amount integer NOT NULL,
    mode character varying(60) NOT NULL,
    status character varying(100) NOT NULL,
    is_verify boolean NOT NULL,
    user_id integer
);


ALTER TABLE public.prico_order OWNER TO ubuntu;

--
-- Name: prico_order_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.prico_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prico_order_id_seq OWNER TO ubuntu;

--
-- Name: prico_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.prico_order_id_seq OWNED BY public.prico_order.id;


--
-- Name: prico_order_item; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.prico_order_item (
    id integer NOT NULL,
    quantity integer NOT NULL,
    price integer NOT NULL,
    order_id integer,
    product_id integer
);


ALTER TABLE public.prico_order_item OWNER TO ubuntu;

--
-- Name: prico_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.prico_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prico_order_item_id_seq OWNER TO ubuntu;

--
-- Name: prico_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.prico_order_item_id_seq OWNED BY public.prico_order_item.id;


--
-- Name: prico_order_status; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.prico_order_status (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(100) NOT NULL,
    date timestamp with time zone NOT NULL,
    order_id integer
);


ALTER TABLE public.prico_order_status OWNER TO ubuntu;

--
-- Name: prico_order_status_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.prico_order_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prico_order_status_id_seq OWNER TO ubuntu;

--
-- Name: prico_order_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.prico_order_status_id_seq OWNED BY public.prico_order_status.id;


--
-- Name: prico_otp_login; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.prico_otp_login (
    id integer NOT NULL,
    otp character varying(10) NOT NULL,
    attempt integer NOT NULL,
    user_id integer
);


ALTER TABLE public.prico_otp_login OWNER TO ubuntu;

--
-- Name: prico_otp_login_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.prico_otp_login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prico_otp_login_id_seq OWNER TO ubuntu;

--
-- Name: prico_otp_login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.prico_otp_login_id_seq OWNED BY public.prico_otp_login.id;


--
-- Name: prico_prescription; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.prico_prescription (
    id integer NOT NULL,
    order_id integer
);


ALTER TABLE public.prico_prescription OWNER TO ubuntu;

--
-- Name: prico_prescription_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.prico_prescription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prico_prescription_id_seq OWNER TO ubuntu;

--
-- Name: prico_prescription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.prico_prescription_id_seq OWNED BY public.prico_prescription.id;


--
-- Name: prico_remember; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.prico_remember (
    id integer NOT NULL,
    quantity integer NOT NULL,
    product_id integer,
    user_id integer
);


ALTER TABLE public.prico_remember OWNER TO ubuntu;

--
-- Name: prico_remember_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.prico_remember_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prico_remember_id_seq OWNER TO ubuntu;

--
-- Name: prico_remember_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.prico_remember_id_seq OWNED BY public.prico_remember.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: cms_aboutus_information id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_aboutus_information ALTER COLUMN id SET DEFAULT nextval('public.cms_aboutus_information_id_seq'::regclass);


--
-- Name: cms_available id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_available ALTER COLUMN id SET DEFAULT nextval('public.cms_available_id_seq'::regclass);


--
-- Name: cms_benifits id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_benifits ALTER COLUMN id SET DEFAULT nextval('public.cms_benifits_id_seq'::regclass);


--
-- Name: cms_category id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_category ALTER COLUMN id SET DEFAULT nextval('public.cms_category_id_seq'::regclass);


--
-- Name: cms_contact_us id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_contact_us ALTER COLUMN id SET DEFAULT nextval('public.cms_contact_us_id_seq'::regclass);


--
-- Name: cms_employee id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_employee ALTER COLUMN id SET DEFAULT nextval('public.cms_employee_id_seq'::regclass);


--
-- Name: cms_feature id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_feature ALTER COLUMN id SET DEFAULT nextval('public.cms_feature_id_seq'::regclass);


--
-- Name: cms_image id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_image ALTER COLUMN id SET DEFAULT nextval('public.cms_image_id_seq'::regclass);


--
-- Name: cms_main_category id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_main_category ALTER COLUMN id SET DEFAULT nextval('public.cms_main_category_id_seq'::regclass);


--
-- Name: cms_offers id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_offers ALTER COLUMN id SET DEFAULT nextval('public.cms_offers_id_seq'::regclass);


--
-- Name: cms_offers_product id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_offers_product ALTER COLUMN id SET DEFAULT nextval('public.cms_offers_product_id_seq'::regclass);


--
-- Name: cms_product id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_product ALTER COLUMN id SET DEFAULT nextval('public.cms_product_id_seq'::regclass);


--
-- Name: cms_question id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_question ALTER COLUMN id SET DEFAULT nextval('public.cms_question_id_seq'::regclass);


--
-- Name: cms_review id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_review ALTER COLUMN id SET DEFAULT nextval('public.cms_review_id_seq'::regclass);


--
-- Name: cms_side_effect id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_side_effect ALTER COLUMN id SET DEFAULT nextval('public.cms_side_effect_id_seq'::regclass);


--
-- Name: cms_site_information id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_site_information ALTER COLUMN id SET DEFAULT nextval('public.cms_site_information_id_seq'::regclass);


--
-- Name: cms_slider id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_slider ALTER COLUMN id SET DEFAULT nextval('public.cms_slider_id_seq'::regclass);


--
-- Name: cms_terms_and_conditions id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_terms_and_conditions ALTER COLUMN id SET DEFAULT nextval('public.cms_terms_and_conditions_id_seq'::regclass);


--
-- Name: cms_vendor id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_vendor ALTER COLUMN id SET DEFAULT nextval('public.cms_vendor_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: prico_cart id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_cart ALTER COLUMN id SET DEFAULT nextval('public.prico_cart_id_seq'::regclass);


--
-- Name: prico_customer id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_customer ALTER COLUMN id SET DEFAULT nextval('public.prico_customer_id_seq'::regclass);


--
-- Name: prico_forget_password_otp id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_forget_password_otp ALTER COLUMN id SET DEFAULT nextval('public.prico_forget_password_otp_id_seq'::regclass);


--
-- Name: prico_notification id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_notification ALTER COLUMN id SET DEFAULT nextval('public.prico_notification_id_seq'::regclass);


--
-- Name: prico_order id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_order ALTER COLUMN id SET DEFAULT nextval('public.prico_order_id_seq'::regclass);


--
-- Name: prico_order_item id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_order_item ALTER COLUMN id SET DEFAULT nextval('public.prico_order_item_id_seq'::regclass);


--
-- Name: prico_order_status id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_order_status ALTER COLUMN id SET DEFAULT nextval('public.prico_order_status_id_seq'::regclass);


--
-- Name: prico_otp_login id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_otp_login ALTER COLUMN id SET DEFAULT nextval('public.prico_otp_login_id_seq'::regclass);


--
-- Name: prico_prescription id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_prescription ALTER COLUMN id SET DEFAULT nextval('public.prico_prescription_id_seq'::regclass);


--
-- Name: prico_remember id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_remember ALTER COLUMN id SET DEFAULT nextval('public.prico_remember_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add order	7	add_order
26	Can change order	7	change_order
27	Can delete order	7	delete_order
28	Can view order	7	view_order
29	Can add remember	8	add_remember
30	Can change remember	8	change_remember
31	Can delete remember	8	delete_remember
32	Can view remember	8	view_remember
33	Can add prescription	9	add_prescription
34	Can change prescription	9	change_prescription
35	Can delete prescription	9	delete_prescription
36	Can view prescription	9	view_prescription
37	Can add otp_login	10	add_otp_login
38	Can change otp_login	10	change_otp_login
39	Can delete otp_login	10	delete_otp_login
40	Can view otp_login	10	view_otp_login
41	Can add order_status	11	add_order_status
42	Can change order_status	11	change_order_status
43	Can delete order_status	11	delete_order_status
44	Can view order_status	11	view_order_status
45	Can add order_item	12	add_order_item
46	Can change order_item	12	change_order_item
47	Can delete order_item	12	delete_order_item
48	Can view order_item	12	view_order_item
49	Can add forget_password_otp	13	add_forget_password_otp
50	Can change forget_password_otp	13	change_forget_password_otp
51	Can delete forget_password_otp	13	delete_forget_password_otp
52	Can view forget_password_otp	13	view_forget_password_otp
53	Can add customer	14	add_customer
54	Can change customer	14	change_customer
55	Can delete customer	14	delete_customer
56	Can view customer	14	view_customer
57	Can add cart	15	add_cart
58	Can change cart	15	change_cart
59	Can delete cart	15	delete_cart
60	Can view cart	15	view_cart
61	Can add aboutus_information	16	add_aboutus_information
62	Can change aboutus_information	16	change_aboutus_information
63	Can delete aboutus_information	16	delete_aboutus_information
64	Can view aboutus_information	16	view_aboutus_information
65	Can add benifits	17	add_benifits
66	Can change benifits	17	change_benifits
67	Can delete benifits	17	delete_benifits
68	Can view benifits	17	view_benifits
69	Can add category	18	add_category
70	Can change category	18	change_category
71	Can delete category	18	delete_category
72	Can view category	18	view_category
73	Can add contact_us	19	add_contact_us
74	Can change contact_us	19	change_contact_us
75	Can delete contact_us	19	delete_contact_us
76	Can view contact_us	19	view_contact_us
77	Can add main_category	20	add_main_category
78	Can change main_category	20	change_main_category
79	Can delete main_category	20	delete_main_category
80	Can view main_category	20	view_main_category
81	Can add offers	21	add_offers
82	Can change offers	21	change_offers
83	Can delete offers	21	delete_offers
84	Can view offers	21	view_offers
85	Can add product	22	add_product
86	Can change product	22	change_product
87	Can delete product	22	delete_product
88	Can view product	22	view_product
89	Can add site_information	23	add_site_information
90	Can change site_information	23	change_site_information
91	Can delete site_information	23	delete_site_information
92	Can view site_information	23	view_site_information
93	Can add slider	24	add_slider
94	Can change slider	24	change_slider
95	Can delete slider	24	delete_slider
96	Can view slider	24	view_slider
97	Can add terms_and_conditions	25	add_terms_and_conditions
98	Can change terms_and_conditions	25	change_terms_and_conditions
99	Can delete terms_and_conditions	25	delete_terms_and_conditions
100	Can view terms_and_conditions	25	view_terms_and_conditions
101	Can add vendor	26	add_vendor
102	Can change vendor	26	change_vendor
103	Can delete vendor	26	delete_vendor
104	Can view vendor	26	view_vendor
105	Can add side_effect	27	add_side_effect
106	Can change side_effect	27	change_side_effect
107	Can delete side_effect	27	delete_side_effect
108	Can view side_effect	27	view_side_effect
109	Can add review	28	add_review
110	Can change review	28	change_review
111	Can delete review	28	delete_review
112	Can view review	28	view_review
113	Can add question	29	add_question
114	Can change question	29	change_question
115	Can delete question	29	delete_question
116	Can view question	29	view_question
117	Can add offers_product	30	add_offers_product
118	Can change offers_product	30	change_offers_product
119	Can delete offers_product	30	delete_offers_product
120	Can view offers_product	30	view_offers_product
121	Can add image	31	add_image
122	Can change image	31	change_image
123	Can delete image	31	delete_image
124	Can view image	31	view_image
125	Can add feature	32	add_feature
126	Can change feature	32	change_feature
127	Can delete feature	32	delete_feature
128	Can view feature	32	view_feature
129	Can add employee	33	add_employee
130	Can change employee	33	change_employee
131	Can delete employee	33	delete_employee
132	Can view employee	33	view_employee
133	Can add available	34	add_available
134	Can change available	34	change_available
135	Can delete available	34	delete_available
136	Can view available	34	view_available
137	Can add notification	35	add_notification
138	Can change notification	35	change_notification
139	Can delete notification	35	delete_notification
140	Can view notification	35	view_notification
141	Can add custid	36	add_custid
142	Can change custid	36	change_custid
143	Can delete custid	36	delete_custid
144	Can view custid	36	view_custid
145	Can add delivery_charge	37	add_delivery_charge
146	Can change delivery_charge	37	change_delivery_charge
147	Can delete delivery_charge	37	delete_delivery_charge
148	Can view delivery_charge	37	view_delivery_charge
149	Can add emailnotification	38	add_emailnotification
150	Can change emailnotification	38	change_emailnotification
151	Can delete emailnotification	38	delete_emailnotification
152	Can view emailnotification	38	view_emailnotification
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$260000$Q1Df7zybC32xfo6NetJWB4$xE3earJvIT9b+5p/Q3LhtflRM1A/O6XlANeMGiUmPnI=	2021-05-11 02:00:13.652338+00	t	abhisekgupta	abhisek	gupta		t	t	2021-05-11 01:49:13+00
3	pbkdf2_sha256$260000$ERk7InSYNcj739pFbkjs6g$TbhjcqQkFw4Hlh6FgzoZcOYiAXK5kBZcAJv1YFMz+NM=	2021-05-11 03:52:46.827992+00	f	abhishekgupta63221422@gmail.com	abhishek	Gupta	abhishekgupta63221422@gmail.com	f	t	2021-05-11 03:40:06.858193+00
4	pbkdf2_sha256$260000$WEuRB7nxsICNpE62qR8cHU$rVccX2A5mrb0x5FqGaFAFJg4RP+WW/9oL7wK6LemWLY=	2021-05-13 18:49:46.428623+00	f	suchitchouhan@protonmail.com	suchit	chouhan	suchitchouhan@protonmail.com	f	t	2021-05-12 23:10:56.023767+00
1	pbkdf2_sha256$260000$XPfDGFIbgmEGi36w1IBgJl$O4BRbfUBVBSg+QAbhdmAPobrMxkYwuNAnCLKqx2BjYU=	2021-05-15 13:15:34.429174+00	t	suchit			suchitchouhan@outlook.com	t	t	2021-05-10 14:18:11.582035+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: cms_aboutus_information; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_aboutus_information (id, name, description, image) FROM stdin;
2	Who we are – Gromdy is India’s first fastest delivering pharmacy and grocery products!	Gromdy  delivers  medicines and grocery product in  fastest way possible to you, so that you don’t have to wait for several days just for a Medicine leaves or for few edible things. We are now operating in Indirapuram Region, Ghaziabad, Once our plan is successfully implemented here  we will expand to other cities of India in upcoming 2-3 years	benifits/about_us_1.png
3	What we do – we offer grocery and medicines to you in short period of time possible	Gromdy offers a wide range of prescription medicines , Grocery and health products conveniently to our doorstep at lower cost from medical store.	noimage.jpg
4	One Point solution for all of your demand	We are providing most of the available medicines and grocery product to your doorstep. You can enjoy your life with your loved ones,  we will take care of all demand, because you people are our loved ones	benifits/about_us_1_47UbrHm.png
\.


--
-- Data for Name: cms_available; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_available (id, product_id, vendor_id) FROM stdin;
\.


--
-- Data for Name: cms_benifits; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_benifits (id, name, description, image) FROM stdin;
\.


--
-- Data for Name: cms_category; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_category (id, name, description, url_slug, image, keyword, main_category_id) FROM stdin;
5	Covid Essentials	These products can help you to protect ourselves from  global pandemic SARS COVID19	Covid-essentials	category/covid_19_essentials.png	corona virus, virus, covid, sanitizers, sanitises, dettol, dettol sanitizers,lifeboy	7
6	Personal care	Personal care or toiletries are consumer products used in personal hygiene and for beautification.	Personal-care	noimage.jpg	cream, shampoo, hair oil, hair color, hair colour, moisturizers	7
7	Cough and Cold	cough and cold	Cough-and-Cold	noimage.jpg	rootmed	4
8	Sex and wellness	These products are for people who are older than 18 years	Sex-and-wellness	noimage.jpg	condoms, sex, durex, manforce	7
9	Diabetes	Diabetes is a disease that occurs when your blood glucose, also called blood sugar, is too high. Blood glucose is your main source of energy and comes from the food you eat. Insulin, a hormone made by the pancreas, helps glucose from food get into your cells to be used for energy.	Diabetes	noimage.jpg	Diabetes, high blood, sugar	7
10	Toothpastes & Tooth brushes	Toothpaste is used to promote oral hygiene: it is an abrasive that aids in removing dental plaque and food from the teeth, assists in suppressing halitosis, and delivers active ingredients (most commonly fluoride) to help prevent tooth decay (dental caries) and gum disease (gingivitis).\r\n\r\nA toothbrush is an oral hygiene instrument used to clean the teeth, gums, and tongue. It consists of a head of tightly clustered bristles, atop of which toothpaste can be applied, mounted on a handle which facilitates the cleaning of hard-to-reach areas of the mouth.	Toothpastes-Tooth-brushes	noimage.jpg	Toothpaste, Tooth brush, colgate, closeup, dant kanti, patanjali dant kanti	7
11	Creams and Face washes	description	Creams-and-Face-washes	noimage.jpg	creams, face wash, face cream fair and lovely cream	7
12	Edible oil	Edible oils, the source of essential fatty acids procured from plant, animal, or synthetic fat, is used in frying, baking, and other types of cooking/food preparations	Edible-oil	noimage.jpg	sarso ka tel, refind, mustaard oil, fortune, Maanik refind, nutrilive, parivar oil,	8
13	Flours	A powder obtained by grinding grain, typically wheat, and used to make bread, cakes, and pastry	Flours	noimage.jpg	atta, ashirvaad atta, wheat flour, chana flour, rice flour	8
14	Beverages	A liquid to consume, usually excluding water; a drink. This may include tea, coffee, liquor, beer, milk, juice, or soft drinks.	Beverages	noimage.jpg	Coke, pepse, tea, green tea, limca,	8
15	Health Drink	A liquid or pulpy product that is beneficial to body	Health-Drink	noimage.jpg	Horlicks, bournvita, real, juice health drink	7
16	Spices	A spice is a seed, fruit, root, bark, or other plant substance primarily used for flavoring or coloring food. Spices are distinguished from herbs, which are the leaves, flowers, or stems of plants used for flavoring or as a garnish	Spices	noimage.jpg	Haldi powder, hing, mirch powder garam masala	8
\.


--
-- Data for Name: cms_contact_us; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_contact_us (id, name, message, email, phone, date) FROM stdin;
\.


--
-- Data for Name: cms_employee; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_employee (id, is_verified, user_id) FROM stdin;
1	t	1
2	t	2
\.


--
-- Data for Name: cms_feature; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_feature (id, name, description, product_id) FROM stdin;
\.


--
-- Data for Name: cms_image; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_image (id, image, product_id) FROM stdin;
2	product/Dettol_sanitizers_01.png	4
3	product/Dettol_sanitizers_02.png	4
4	product/Dettol_sanitizers_03.png	4
5	product/Dettol_sanitizers_04.png	4
6	product/masks_01.png	5
7	product/masks_02.png	5
8	product/masks_03.png	5
9	product/masks_4.png	5
10	product/Globes_2.png	6
12	product/Globes_1.png	6
13	product/Globes_3.png	6
14	product/thermometer_01.png	7
15	product/thermometer_02.png	7
16	product/thermometer_03.png	7
17	product/thermometer_04.png	7
18	product/thermometer_05.png	7
19	product/immunity_booster_1.png	8
20	product/immunity_booster_3.png	8
21	product/immunity_booster_4.png	8
23	product/immunity_booster_2.png	8
100	product/cofsisls_dry_cough01.png	25
101	product/cofsisls_dry_wet_cough_zv5LZaF.png	25
24	product/floor_cleaners_05.png	9
25	product/floor_cleaners.png	9
26	product/floor_cleaners_01.png	9
27	product/floor_cleaners_02.png	9
28	product/floor_cleaners_03.png	9
29	product/floor_cleaners_04.png	9
30	product/cream_1.png	10
31	product/cream_2.png	10
32	product/cream_3.png	10
33	product/cream_4.png	10
34	product/cream_5.png	10
103	product/cofsisls_03_DlSRuP9.png	25
35	product/cream_11.png	11
36	product/cream_14.png	11
37	product/cream_12.png	11
38	product/cream_132.png	11
39	product/cream_21.png	12
40	product/cream_22.png	12
41	product/cream_23.png	12
42	product/cream_24.png	12
44	product/cream_25_48eip3o.png	12
45	product/himalaya_face_cream_1.png	12
46	product/himalaya_face_cream_2.png	13
47	product/himalaya_face_cream_3.png	13
48	product/nivea_men_cream_01.png	14
49	product/nivea_men_cream_02.png	14
50	product/nivea_men_cream_04.png	14
51	product/nivea_men_cream_03.png	14
52	product/nivea_men_cream_05.png	14
53	product/himalaya_face_men_01.png	15
54	product/himalaya_face_men_02.png	15
55	product/himalaya_face_men_03.png	15
56	product/himalaya_face_men_04.png	15
57	product/himalaya_face_men_05.png	15
58	product/himalaya_face_and_beardo_wash__1.png	16
59	product/himalaya_face_and_beardo_wash__2.png	16
60	product/himalaya_face_and_beardo_wash_5.png	16
61	product/himalaya_face_and_beardo_wash__3.png	16
62	product/nivie_face_wash_women_01.png	17
63	product/nivie_face_wash_women_02.png	17
64	product/nivie_face_wash_women_03.png	17
65	product/himalaya_neem_face_wash1.png	18
66	product/himalaya_neem_face_wash2.png	18
67	product/himalaya_neem_face_wash3.png	18
68	product/himalaya_neem_face_wash5.png	18
69	product/himalaya_neem_face_wash.png	18
70	product/cinthol_soap_1.png	19
71	product/cinthol_soap_2.png	19
72	product/cinthol_soap_3.png	19
73	product/cinthol_soap_lime_4.png	19
74	product/cinthol_soap_lime_5.png	19
75	product/dabur_amla_hair_oil_1.png	20
76	product/dabur_amla_oil_1_8_8_in.png	20
77	product/dabur_amla_oil_1_520_360.png	20
78	product/dabur_amla_oil_1_3.png	20
79	product/clean_clear_face_wash_1.png	21
80	product/clean_clear_face_wash_2.png	21
81	product/clean_clear_face_wash_3.png	21
82	product/clean_clear_face_wash_4.png	21
83	product/clean_clear_face_wash_5.png	21
84	product/bajaj_alomnd_hair_oil_2.png	22
85	product/bajaj_alomnd_hair_oil_1.png	22
86	product/bajaj_alomnd_hair_oil_5.png	22
87	product/bajaj_alomnd_hair_oil_4.png	22
88	product/benadyrl_dr_01.png	23
89	product/benadyrl_dr_02.png	23
90	product/benadyrl_dr_03.png	23
91	product/benadyrl_dr_05.png	23
92	product/benadyrl_dr_06.png	23
93	product/cofsisls_01.png	24
104	product/cofsisls_wet_cough_01.png	26
105	product/cofsisls_03_Jauagcy.png	26
106	product/cofsisls_02.png	27
107	product/cofsisls__comman_for_all_ALr6tIf.png	27
108	product/cofsisls_03_qYDtBsD.png	27
109	product/cofsisls_cough_syrup_01.png	24
110	product/cofsisls_03.png	24
111	product/dabur_honitus_1.png	28
112	product/dabur_honitus_2.png	28
113	product/dabur_honitus_3.png	28
115	product/dabur_honitus_4.png	28
116	product/dabur_honitus_5.png	28
117	product/himalaya_koflet_1.png	29
118	product/himalaya_koflet_2.png	29
119	product/himalaya_koflet_5.png	29
120	product/himalaya_koflet_3.png	29
121	product/himalaya_koflet_4.png	29
122	product/durex_extra_time_1.png	30
123	product/durex_extra_time_2.png	30
124	product/durex_extra_time_3.png	30
125	product/durex_extra_time_4.png	30
126	product/durex_extra_time_5.png	30
127	product/durex_extra_thin_1.png	31
128	product/durex_extra_thin_2.png	31
129	product/durex_extra_thin_3.png	31
130	product/durex_extra_thin_4.png	31
131	product/Durex_comman1.png	31
132	product/Durex_comman2.png	31
133	product/Durex_Air_1.png	32
134	product/Durex_Air_2.png	32
135	product/Durex_Air_4.png	32
136	product/Durex_Air_6.png	32
137	product/Durex_comman1_6cbvzgC.png	32
138	product/Durex_comman4.png	32
139	product/Durex_Air_3.png	32
140	product/glucometer_1.png	33
141	product/glucometer_2.png	33
142	product/glucometer_4.png	33
143	product/glucometer_5.png	33
144	product/glucometer_6.png	33
145	product/glucometer_7.png	33
146	product/glucometer_8.png	33
147	product/glucometer_9.png	33
148	product/Dr_morepen_glucometer_1.png	34
149	product/Dr_morepen_glucometer.png	34
150	product/Dr_morepen_glucometer_2.png	34
151	product/Dr_morepen_glucometer_3.png	34
152	product/Dr_morepen_glucometer_4.png	33
153	product/Dr_morepen_glucometer5.png	34
154	product/Dr_morepen_glucometer_strips.png	35
155	product/Dr_morepen_glucometer_strips1.png	22
156	product/sugar_free_1.png	36
157	product/sugar_free_3.png	36
158	product/sugar_free_5.png	36
159	product/sugar_free_6.png	36
160	product/sugar_free_pellet.png	37
161	product/sugar_free_pellet_1.png	37
162	product/sugar_free_pellet_2.png	37
163	product/sugar_free_pellet_2_zFdq3IP.png	37
164	product/sugar_free_6_Lobjz4i.png	37
165	product/sugar_free_3_SO7fPQ4.png	37
166	product/Abbot_diabetic_care_1.png	38
167	product/Abbot_diabetic_care_2.png	38
168	product/Abbot_diabetic_care_3.png	38
169	product/Abbot_diabetic_care_4.png	38
170	product/Abbot_diabetic_care_5.png	38
171	product/Abbot_diabetic_care_6.png	38
172	product/Abbot_diabetic_care_7.png	38
173	product/Himalaya_quista_dn_1.png	39
174	product/Himalaya_quista_dn_2.png	39
175	product/Himalaya_quista_dn_3.png	39
176	product/Himalaya_quista_dn_4.png	39
177	product/Axe_signature_1.png	40
178	product/Axe_signature_2.png	40
179	product/Axe_signature_4.png	40
180	product/Axe_signature_3.png	40
181	product/Axe_signature_5.png	40
182	product/Axe_signature_6.png	40
183	product/Axe_signature_7.png	40
184	product/Fogg_blue_ocean_1.png	41
185	product/Fogg_blue_ocean_2.png	41
187	product/Fogg_blue_ocean_4.png	41
188	product/Fogg_blue_ocean_5.png	41
189	product/Fogg_blue_ocean_6.png	41
190	product/Dabur_chawanprass_1.png	42
191	product/Dabur_chawanprass_2.png	42
192	product/Dabur_chawanprass_3.png	42
193	product/Dabur_chawanprass_4.png	42
194	product/Dabur_chawanprass_5.png	42
195	product/Dabur_chawanprass_sugar_free_1.png	43
196	product/Dabur_chawanprass_sugar_free_2.png	43
197	product/Dabur_chawanprass_sugar_free_3.png	43
198	product/Dabur_chawanprass_sugar_free_4.png	43
199	product/Dabur_chawanprass_5_teAbkGT.png	43
200	product/Engage_perfume_women_3.png	44
201	product/Engage_perfume_women_1.png	44
202	product/Engage_perfume_women_4.png	44
203	product/Engage_perfume_women_6.png	44
204	product/Engage_perfume_women_5.png	44
205	product/Untitled-3.png	44
206	product/colgate_strong_teeth_1.png	45
207	product/colgate_strong_teeth_2.png	45
208	product/colgate_strong_teeth_3.png	45
209	product/colgate_strong_teeth_5.png	45
210	product/colgate_strong_teeth_4.png	45
211	product/sensodyne_fresh_mint_40gm_1.png	46
212	product/sensodyne_fresh_mint_40gm_2.png	46
213	product/sensodyne_fresh_mint_glosmith_logo1.png	46
214	product/sensodyne_fresh_mint_3.png	47
215	product/sensodyne_fresh_mint_4.png	47
216	product/sensodyne_fresh_mint_150gm_1.png	47
217	product/sensodyne_fresh_mint_150gm_2.png	47
218	product/sensodyne_fresh_mint_150gm_3.png	47
219	product/sensodyne_fresh_mint_glosmith_logo1_uoj6iIg.png	47
220	product/Dabur_babbol_1.png	48
221	product/Dabur_babbol_2.png	48
222	product/Dabur_babbol_3.png	48
223	product/Dabur_comman_1.png	48
224	product/Dentoys_herbal_toothpaste.png	49
225	product/Dentoys_herbal_toothpaste_2.png	49
226	product/Dr_morepen_logo_comman.png	49
227	product/Dabur_meshwak_1.png	50
228	product/Dabur_meshwak_3.png	50
229	product/Dabur_meshwak_2.png	50
230	product/Dabur_meshwak_5.png	50
231	product/Dabur_meshwak_4.png	50
232	product/Dabur_logo_comman.png	50
233	product/Emoform_1.png	51
234	product/Emoform_2.png	51
235	product/Emoform_4.png	51
236	product/Emoform_5.png	51
237	product/pepsodent_germi_1.png	52
238	product/pepsodent_germi_3.png	52
239	product/pepsodent_germi_4.png	52
240	product/pepsodent_germi_5.png	52
241	product/pepsodent_germi_6.png	52
242	product/pepsodent_germi_2.png	52
243	product/pepsodent_germi_1_comman.png	52
244	product/colgate_maxfresh_100gm_1.png	53
245	product/colgate_maxfresh_100gm_2.png	53
246	product/colgate_maxfresh_100gm_3.png	53
247	product/colgate_maxfresh_100gm_5.png	53
248	product/colgate_maxfresh_100gm_6.png	53
249	product/himalaya_sprakling_white_80gm_1.png	54
250	product/himalaya_sprakling_white_80gm_2.png	54
251	product/himalaya_sprakling_white_3.png	54
252	product/himalaya_sprakling_white_2.png	54
253	product/himalaya_sprakling_white_comman_all.png	54
255	product/himalaya_sprakling_white_3_6u8RNIy.png	55
256	product/himalaya_sprakling_white_4.png	55
257	product/himalaya_sprakling_white_comman_all_VY1P6tg.png	55
258	product/patanjali_dant_kanti_1.png	56
259	product/patanjali_dant_kanti_2.png	56
260	product/patanjali_dant_kanti_4.png	56
261	product/patanjali_dant_kanti_3.png	56
262	product/X_TAR_1.png	57
263	product/X_TAR_2.png	57
264	product/X_TAR_3.png	57
265	product/X_TAR_4.png	57
266	product/X_TAR_5.png	57
267	product/colgate_total_2.png	58
268	product/colgate_total_1.png	58
269	product/colgate_total_4.png	58
270	product/colgate_total_3.png	58
271	product/close_up_1.png	59
273	product/close_up_7.png	59
274	product/close_up_fresh_breath.png	59
275	product/close_up_fresh_breath_80gm.png	59
276	product/close_up_1_2vZigCK.png	60
277	product/close_up_5.png	60
278	product/close_up_fresh_breath_fDGmBSO.png	60
279	product/close_up_fresh_breath_150gm.png	60
280	product/Fair_lovely_1.png	61
281	product/Fair_lovely_2.png	61
282	product/Fair_lovely_3.png	61
283	product/Fair_lovely_4.png	61
284	product/Fair_lovely_5.png	61
285	product/Fair_lovely_100gm.png	62
286	product/Fair_lovely_2_bSBh7On.png	62
287	product/Fair_lovely_4_KJBRUVv.png	62
288	product/Fair_lovely_5_tuvIGQ8.png	62
289	product/Fair_lovely_ayurvedic_1.png	63
290	product/Fair_lovely_ayurvedic_2.png	63
291	product/Fair_lovely_ayurvedic_3.png	63
292	product/Fair_lovely_ayurvedic_4.png	63
293	product/Fair_lovely_ayurvedic_5.png	63
294	product/Fair_lovely_3_iPi990h.png	63
295	product/Fair_handsome_1.png	64
296	product/Fair_handsome_2.png	64
297	product/Fair_handsome_3.png	64
298	product/Fair_handsome_4.png	65
299	product/Fair_handsome_2_NrzrF6J.png	65
300	product/Fair_handsome_1_KeUOv9M.png	65
301	product/Fair_handsome_5.png	65
302	product/Fair_handsome_5_vI6YcLJ.png	64
303	product/fair_and_lovely_bb_cream_1.png	66
304	product/fair_and_lovely_bb_cream_2.png	66
305	product/fair_and_lovely_bb_cream_9.png	66
306	product/fair_and_lovely_bb_cream_8.png	66
307	product/fair_and_lovely_bb_cream_7.png	66
308	product/fair_and_lovely_bb_cream_8_LSoiKrs.png	67
309	product/fair_and_lovely_bb_cream_5.png	67
310	product/fair_and_lovely_bb_cream_7_GKiJKag.png	67
311	product/fair_and_lovely_bb_cream_10.png	67
312	product/Fair_lovely_3_fXD16xf.png	67
313	product/fair_and_lovely_bb_cream_2_JlsQinr.png	68
314	product/fair_and_lovely_bb_cream_6.png	68
315	product/fair_and_lovely_bb_cream_7_MYjB4mX.png	68
316	product/fair_and_lovely_bb_cream_1_3QD7PZ4.png	68
317	product/fair_and_lovely_bb_cream_10_c0Rj2Yf.png	68
318	product/Lakhme_9to5_1.png	69
319	product/Lakhme_9to5_Beige_1.png	69
320	product/Lakhme_9to5_3.png	69
321	product/Lakhme_9to5_6.png	69
322	product/Lakhme_9to5_5.png	69
323	product/Lakhme_9to5_honey_1.png	70
324	product/Lakhme_9to5_5_MRIq1LQ.png	70
325	product/Lakhme_9to5_6_nhrJro0.png	70
326	product/Lakhme_9to5_3_iH4ETRi.png	70
327	product/ponds_bb_cream_1.png	71
328	product/ponds_bb_cream_2.png	71
329	product/ponds_bb_cream_3.png	71
330	product/ponds_bb_cream_4.png	71
331	product/ponds_bb_cream_6.png	71
332	product/Garnier_men_acno_fight_.png	72
333	product/Garnier_men_acno_fight_2.png	72
334	product/Garnier_men_acno_fight_3.png	72
335	product/Garnier_men_acno_fight_4.png	72
336	product/Garnier_men_acno_fight_5.png	72
337	product/fortune_mustardoil_1L_1.png	73
338	product/fortune_1_mustardoil_1L_12.png	73
339	product/fortune_1_mustardoil_5L_1.png	74
340	product/fortune_1_mustardoil_5L_2.png	74
341	product/fortune_1_mustardoil_5L_3.png	74
342	product/fortune_1_soybeanoil_5L_1.png	75
343	product/fortune_1_soybeanoil_5L_2.png	75
344	product/fortune_1_mustardoil_1L_1.png	76
345	product/fortune_1_soybeanoil_1L_2.png	76
346	product/fortune_1_soybeanoil_1L_3.png	76
347	product/AAshirvaad_atta_10kg_1.png	77
348	product/AAshirvaad_atta_10kg_3.png	77
349	product/AAshirvaad_atta_10kg_comman.png	77
350	product/AAshirvaad_atta_10kg_2.png	78
351	product/AAshirvaad_atta_10kg_1_IkA8RRs.png	78
352	product/AAshirvaad_atta_10kg_comman_q5mpyqZ.png	78
353	product/Rajdhani_besan_1.png	79
354	product/Rajdhani_besan_2.png	79
355	product/Rajdhani_besan_3.png	79
356	product/Rajdhani_besan.png	79
357	product/Rajdhani_besan_2_eGIGAM0.png	80
358	product/Rajdhani_besan_1_OdGbXD0.png	80
359	product/Rakes_besan_1.png	81
360	product/Rakes_besan_2.png	81
361	product/tata_tea_premimum_100gm_1.png	82
362	product/tata_tea_premimum_100gm_2.png	82
363	product/tata_tea_premimum_100gm_3.png	82
364	product/tata_tea_premimum_250gm_1.png	83
365	product/tata_tea_premimum_100gm_3_EFoKWDG.png	83
366	product/tata_tea_premimum_100gm_1_Egwe2t3.png	83
367	product/tata_tea_premimum_1kg_1.png	84
368	product/tata_tea_premimum_1kg_2.png	84
369	product/tata_tea_premimum_1kg_3.png	84
370	product/tata_tea_agni_1.png	85
371	product/tata_tea_agni_3.png	85
372	product/tata_tea_agni_2.png	85
373	product/red_level_250gm_1.png	86
374	product/red_level_250gm_2.png	86
375	product/taza_1.png	87
376	product/taza_2.png	87
377	product/taza_100gm_1.png	88
378	product/taza_1_6BuWf1M.png	88
379	product/today_star_1.png	89
380	product/today_star_2.png	89
381	product/BRU_COFFEE_1.png	90
382	product/BRU_COFFEE_2.png	90
383	product/nescafe_1.png	91
384	product/bourn_vita_200gm_1.png	92
385	product/bourn_vita_200gm_1_GHRdXUe.png	92
386	product/bourn_vita_200gm_2.png	92
387	product/bourn_vita_500gm_1.png	93
388	product/bourn_vita_200gm_2_UhZf62r.png	93
389	product/bourn_vita_comman_1.png	93
390	product/bourn_vita_1kg_1.png	94
391	product/bourn_vita_200gm_2_WtmRhaU.png	94
392	product/bourn_vita_1kg_2.png	94
393	product/bourn_vita_comman_3.png	94
394	product/bourn_vita_packet_3.png	95
395	product/bourn_vita_packet_1.png	95
396	product/bourn_vita_packet_2.png	95
397	product/bourn_vita_comman_1_v3lgDEg.png	95
398	product/horlicks_choclate_flavour_500gm_1.png	96
399	product/horlicks_choclate_flavour_500gm_3.png	96
400	product/horlicks_comman_2.png	96
401	product/horlicks_comman_1.png	96
402	product/horlicks_1kg_1.png	97
403	product/horlicks_1kg_2.png	97
404	product/horlicks_1kg_3.png	97
405	product/horlicks_comman_2_FSCeqyA.png	97
406	product/glucon_D_500gm_1.png	98
407	product/glucon_D_500gm_2.png	98
408	product/glucon_D_500gm_3.png	98
409	product/glucon_D_lime_1.png	99
410	product/glucon_D_lime_2.png	99
411	product/glucon_D_lime_3.png	99
412	product/glucon_D_lime_4.png	99
413	product/catch_hing_10gm.png	100
414	product/catch_hing_comman_2.png	100
415	product/catch_hing_comman_4.png	100
416	product/catch_hing_comman_5.png	100
417	product/catch_hing_10gm_3.png	101
418	product/catch_hing_comman_2_2EwyfPY.png	101
419	product/catch_hing_comman_3.png	101
420	product/catch_hing_comman_4_owYvNHq.png	101
421	product/catch_hing_comman_5_oeklivI.png	101
422	product/catch_hing_50gm.png	102
423	product/catch_hing_comman_1.png	102
424	product/catch_hing_comman_4_akHsl0y.png	102
425	product/catch_hing_comman_5_ygyKEJ5.png	102
426	product/mdh_haldi_powder_100gm_2.png	103
427	product/mdh_haldi_powder_100gm_1.png	103
428	product/mdh_haldi_powder_100gm_3.png	103
429	product/glucon_D_lime_1_VwQt8SZ.png	104
\.


--
-- Data for Name: cms_main_category; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_main_category (id, name, description, url_slug) FROM stdin;
4	Allopathic	Allopathic medicine, or allopathy, refers to science-based, modern medicine, i.e. with drugs having effects opposite to the symptoms.	Allopathic
7	Popular categories	These are daily use essential products	Popular-categories
8	Grocery	Edible foods products	Grocery
\.


--
-- Data for Name: cms_offers; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_offers (id, name, description, url_slug, image, keyword) FROM stdin;
3	Upto 30% off on cough and cold medicines	description	Upto-30-off-on-cough-and-cold-medicines	noimage.jpg	rootmed
5	Upto 20% on immunity booster products	Enhances innate immune systems\r\nHalts and prevents disease progression.	Immunity-Booster	noimage.jpg	Immunity boosters, imunity
6	Diabetic care supplements	These supplement will enable you to control your diabetes in healthy and tasty manner	Diabetic-care-supplements	noimage.jpg	Diabetic care, blood sugar supplements
\.


--
-- Data for Name: cms_offers_product; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_offers_product (id, offers_id, product_id) FROM stdin;
3	3	23
4	3	24
5	3	26
9	3	29
10	5	42
11	5	43
12	6	36
13	6	37
14	6	38
\.


--
-- Data for Name: cms_product; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_product (id, name, description, stock, brandname, actual_price, price, is_verified, url_slug, keyword, category_id) FROM stdin;
4	Instant Hand Sanitizer	Dettol Hand Sanitizer kills 99.9% of germs instantly, without water. Use anytime, anywhere: while in car, office, handbag, picnics, nappy change, travel, sports etc. Leaves your hands refreshed. Use as often as required	t	Dettol	25	21	f	Hand-Sanitizers	Sanitizers, Dettol, SARS-COVID	5
5	Masks	Wearing a medical mask is one of the prevention measures to limit spread of certain respiratory diseases, including 2019- nCoV, in affected areas.	t	N95	70	60	f	Masks	Masks, N95, Covid, covid19, corona virus	5
6	Gloves	Gloves help keep your hands clean and lessen your chance of getting germs that can make you sick. Wear gloves every time you touch blood, bodily fluids, bodily tissues, mucous membranes, or broken skin	t	Rbgiit	50	45	f	Gloves	Globes, safety, precautions, rubber gloves, latex, hand gloves for covid, covid protection products	5
7	Thermometer	A medical thermometer (also called clinical thermometer) is used for measuring human or animal body temperature.	t	Hicks	150	140	f	Thermometer	thermometer, Thermometer, covid essentials, fever, temperature	5
8	Immunity Booster	“immune boosting.” Specific benefits are associated with improved mood, anti-inflammation, increased metabolism, disease prevention, personal protection, gut health, better cognition, and skin care	t	Dabur	250	200	f	Immunity-booster	covid, immunity booster, imunity, sars covid	5
9	Floor Cleaner	To prevent injuries due to tripping or slipping.\r\nTo beautify the floor.\r\nTo remove stains, dirt, litter and obstructions.\r\nTo remove grit and sand which scratch and wear down the surface.\r\nTo remove allergens, in particular dust.	t	Lizol	300	180	f	Floor-cleaners	rootmed	5
16	Himalaya Men Face & Beard Wash 80ml	Deep cleanses and gives clear, fresh skin\r\nSkin Type: All Skin Types	t	Himalaya	160	148	f	Himalaya-Men-Face-Beard-Wash-80ml	Himalaya, Men, Face & Beard, face Wash-80ml	6
17	NIVEA Women Purifying Face Wash, for Oily Skin, 150 ml	Its microbead formula contains ocean algae extracts and hydra IQ\r\nDeeply cleanses pores while reducing excesss sebum\r\nCleanses your pores and vitalizes the skin making it look pure and clear.\r\nMaintains skin's natural moisture balance	t	Nivea	175	160	f	NIVEA-Women-Purifying-Face-Wash	NIVEA, Women, Purifying, Face, Wash	6
19	Cinthol Lime Bath Soap, 100g	Refreshing lime fragrance that revitalizes your senses\r\nPleasant deo fragrance that lasts all day long\r\nSuitable for all skin types and all age groups	t	Godrej	130	120	f	Cinthol-Lime-Bath-Soap	Cinthol-Lime-Bath-Soap, cinthol soap, cinthol	6
20	Dabur Amla hair oil 275 ml	It makes hair stronger from the roots\r\nHelp in hair growth \r\nProvide nourishment to  hair	t	Dabur	140	132	f	Dabur-Amla-hair-oil-275-ml	Dabur Amla hair oil 275 ml, hair oil, dabur amla, amla	6
21	Clean & Clear Foaming Face Wash For Oily Skin, 150ml	Clean & Clear Foaming face wash is specially designed to cleanse thoroughly and remove excess oil\r\nRemoves  Dirt & Oil , nourishes skin\r\nHelps Prevent  Blackheads & Pimples \r\nSuitable for Normal to Oily skin\r\nFace wash for women and men	t	Clean & Clear	165	160	f	Clean-Clear-Foaming-Face-Wash-For-Oily-Skin-150ml	clean and clear, face wash 150ml, oily skin face wash, facewash for men, facewash for women	6
22	Bajaj Almond Drops Hair Oil, 200ml	Almond Oil has 6x Vitamin E that helps reduce hairfall and gives beautiful and strong hair.\r\nIt is light hair oil having no stickiness, which makes you enjoy different hair styles daily	t	Bajaj	125	118	f	Bajaj-Almond-Drops-Hair-Oil-200-ml	Bajaj Almond Drops Hair Oil, 200ml, hair oil, almond oil	6
23	Benadryl DR Syrup 100ml	Benadryl Syrup is used in the treatment of cough. It relieves allergy symptoms such as runny nose, stuffy nose, sneezing, watery eyes and congestion or stuffiness. It also thins mucus in the nose, windpipe and lungs, making it easier to cough out	t	johnson & Johnson Pvt Ltd	102	99	f	Benadryl-DR-Syrup-100-ml	Benadryl DR Syrup, cough syrup	7
24	Cofsils 100ML Syrup	Cofsils Cough Syrup is used in the treatment of cough. It relieves allergy symptoms such as runny nose, stuffy nose, sneezing, watery eyes and congestion or stuffiness. It also thins mucus in the nose, windpipe and lungs, making it easier to cough out.	t	Cipla	90	85	f	Cofsils-100ML-Syrup	Cofsils, cough syrup, cipla cough syrup	7
25	COFSILS DRY COUGH Syrup 100ml	It relieves allergy symptoms such as runny nose, stuffy nose, sneezing, watery eyes and congestion or stuffiness. It also thins mucus in the nose, windpipe and lungs, making it easier to cough out.	t	Cipla	95	76	t	COFSILS-DRY-COUGH-Syrup-100-ml	COFSILS,DRY COUGH Syrup, cough syrup	7
26	COFSILS WET COUGH Syrup 100ml (Cipla)	It relieves allergy symptoms such as runny nose, stuffy nose, sneezing, watery eyes and congestion or stuffiness. It also thins mucus in the nose, windpipe and lungs, making it easier to cough out.	t	Cipla	97	95	t	COFSILS-WET-COUGH-Syrup-100-ml	COFSILS,WET COUGH Syrup, cipla cough syrup	7
14	Nivea Men Intensive Moisturising Cream 50 ml	Immediately alleviates dry and tight skin, provides intense long- lasting moisture and care and helps protect the skin against harmful UVA and UVB rays. Benefits The rich moisturising formula with Vitamin E, Vitamin H &UV Filters.	t	Nivea	1094	999	f	Nivea-Men-Intensive-Moisturising-Cream-50-ml	Nivea men, men cream, men skin moisturizer	11
10	olay	Reduces appearance of dark spots.\r\nBrightens dull skin.\r\nBrightens skin tone.\r\nEvens skin tone.\r\nMoisturises.\r\nSmoothes skin.\r\nSun protection.	t	Olay	899	719	f	olay	face cream, olay	11
11	L'Oreal Paris Skin Perfect	Age 20+ skin perfect range comprises of a day cream along with cleansing foam\r\nCombined with perlite and it helps keep oiliness, pimples and blemishes at bay through your twenties while giving you that perfect clear skin glow	t	L'Oreal Paris	315	300	f	LOreal-Paris	L'Oreal Paris, cream, sun protection, pimples	11
12	Lakme youth infinity	Luminizing pearls instantly brighten your skin tone.\r\nInsta Collagen boosters help improve elasticity to tighten skin.\r\nSPF 15 PA++ protects skin from the sun's harmful UVA and UVB rays.\r\nUse the crème with the entire Lakme Absolute Youth Infinity range to get a complete sculpted look of the 20’s.\r\nFor the best results, use the product on an everyday basis.	t	Lakme	646	640	f	Lakme	Lakme, youth infinity, cream, face cream	11
15	Himalaya Men Natural Bright Face Cream – SPF 15	Improves skin brightness\r\nEnhances complexion\r\nSun protection	t	Himalaya	75	71	f	Himalaya-Men-Natural-Bright-Face-Cream	Himalaya, Men Natural, Bright-Face-Cream, men face cream, clear men glow	11
13	Himalaya Natural Glow Face Cream 25gm	Himalaya’s Natural Glow Kesar Face Cream is an advanced skin lightening formula.	t	Himalaya	99	90	f	Himalaya-face-cream	face cream, himalaya, cream	11
28	Dabur Honitus Syrup -100ml	Dabur Honitus Madhuvaani is a blend of age-old traditional Ayurvedic Medicine for Cough and Cold which combines Sitopaladi churna with honey as recommended by Ayurved. It is premixed mixture provide effective relief from sore throat, cough and cold. It is a good anti allergic, expectorant and relieves congestion.	t	Dabur	90	85	f	Dabur-Honitus-Syrup-100-ml	Cough syrup, Dabur cough syrup, ayurvedic cough syrup	7
30	Durex Extra Time Condoms	Durex Extra Time Condom is designed to provide greater sensitivity and a sleeker feel during sexual intercourse. It has special lubricant that helps it to last longer. This product is designed to prevent pregnancy, give protection against sexually transmitted diseases.	t	Reckitt	228	210	f	Durex-Extra-Time-Condoms	Durex, condoms, sex, sexual wellness, sex protection, manforce	8
31	Durex Extra Thin Condom	It promises you a sleeker feel and heightened sensitivity while providing the same level of reassurance and protection as a regular condom	t	Reckitt	150	140	f	Durex-Extra-Thin-Condom	Durex, condoms, thin condoms, fragrances condoms	8
18	Himalaya Purifying Neem Face Wash 50 ml (Himalaya)	Himalaya Purifying Neem Face Wash is a soap-free, herbal formulation that cleans impurities and helps clear pimples. A natural blend of Neem and Turmeric bring together their antibacterial and antifungal properties to prevent the recurrence of acne over time.	t	Himalaya	65	61	f	Himalaya-Purifying-Neem-Face-Wash-50ml	Himalaya,Purifying,Neem Face Wash, FACE WASH	6
35	Gluco One BG 03 50 Test Strips (Dr Morepen)	Set of 50 strips for one time use only\r\nHelps to keep a track of blood sugar level\r\nHelps to keep diabetes under control\r\nHelps to observe how the treatment program is affecting the blood glucose level	t	Dr Morepen	849	509	f	Gluco-One-BG-03-50-Test-Strips-Dr-Morepen	glucometer strips, strips, blood sugar, diabetes	9
34	Dr Morepen Gulcometer BG-03 KIT WITH FREE 25 STRIPS	A glucometer is a medical device used to determine the approximate concentration of glucose in the blood. Dr Morepen Glucometer from the store house of Dr Morepen ensures a high level of efficiency. It is easily available in the market and is one of the fastest meters that provides accurate results.	t	Dr Morepen	1490	600	f	Dr-Morepen-Gulcometer-BG-03-KIT-WITH-FREE-25-STRIPS	Glucometer, Dr Morepen, diabetes, blood sugar	9
33	Accu-Chek Active Blood Glucose Meter Kit (Accu-check)	The system is suitable for testing blood glucose with blood obtained from alternative sites. The system must not be used to diagnose or rule out diabetes.	t	Accu-check	1300	1250	f	Accu-Chek-Active-Blood-Glucose-Meter-Kit-Accu-check	diabetes, blood sugar, glucometer, sugar meter, sugar	9
27	Cofsils Naturals Cough Syrup Bottle Of 100 Ml (Cipla)	This natural syrup suppresses the cough reflex, relieves chest congestion, reduces throat pain and irritation, and enhances immunity against recurrent cough and cold.\r\nA cough formula that combines medicinal herbs beneficial to suppressing cough reflexes and relieving chest congestion, Cofsils Natural Cough Syrup also exerts soothing, cooling actions to reduce throat pain and discomfort.\r\nThe honey-based formulation of the syrup even helps to relieve night-time coughing in children.\r\nIngredients: Honey, Munkka, Yastimadhu, Tulsi, Banapsha, Vasa, Talishpatra, Shati, Shunthi, Haldi, Pippali	t	Cipla	85	72	f	Cofsils-Naturals-Cough-Syrup-Bottle-Of-100-Ml-Cipla	Cofsils, Naturals Cough Syrup, cough syrup, cipla cough syrup	7
32	Durex Air Condoms	Durex brings to you the thinnest ever condoms for greater sensitivity and intimacy, while still providing a high level of protection. ... Made of premium quality latex, Durex condoms are reliable. Durex Air condoms are designed to feel more natural, while the transparent ultra-thin latex helps highlight sensitivity.	t	Reckitt	200	190	f	Durex-Air-Condoms	Air condoms, durex, condoms, sex lubricant	8
29	Himalaya Herbal Koflet SF Linctus Syrup 100ml	Koflet is beneficial in both productive and dry cough. The mucolytic and expectorant properties reduce the viscosity of bronchial secretions and facilitate expectoration. Koflet's peripheral antitussive (cough suppressant) action reduces bronchial mucosal irritation and related bronchospasms.	t	Himalaya	80	73	f	Himalaya-Herbal-Koflet-SF-Linctus-Syrup-100-ml	Himalaya cough syrup, herbal cough syrup, ayurvedic cough syrup	7
36	Sugar Free 100gm	A sugar substitute is a food additive that provides a sweet taste like that of sugar while containing significantly less food energy than sugar-based sweeteners, making it a zero-calorie or low-calorie sweetener	t	Sugar Free	150	140	f	Sugar-Free-100-gm	Sugar-free, diabetes	9
37	Sugar Free Gold Pellets, 50 Pellets	Sugar-Free Gold Low-Calorie Sweetener is a healthier alternative to sugar. It is made from aspartame, a protein derivative.	t	Sugar Free	25	23	f	Sugar-Free-Gold-Pellets-50-Pellets	Sugar Free, diabetes	9
38	Abbott Ensure (Glucerna SR) 400gm Vanilla Powder Diabetic Nutrition Therapeutic	The Glucerna range of products is designed to support dietary and weight management in people with diabetes. It has been scientifically formulated to have a low Glycemic Index (GI) to support diabetes management.	t	Abbott	690	650	f	Abbott-Ensure-Glucerna-SR-400-gm-Vanilla-Powder-Diabetic-Nutrition-Therapeutic	Diabetic, Abbott, Diabetic	9
39	Quista DN (Himalaya)	Quista DN is a nutritional supplement scientifically designed to benefit the dietary regimen of diabetic and prediabetic individuals.	t	Himalaya	600	550	f	Quista-DN-Himalaya	rootmed	9
40	Axe Signature Intense Strong Woody No Gas Body Deodorant For Men(154ml)	Complete your morning preparation with the unforgettable fragrance of Axe Signature Mysterious Body Perfume. Simply spray it directly on your skin, underarms, chest and neck. Add that extra twist to your style. Like you've got something different from the rest, helping you make an impression that lingers on.\r\nSensual & bold fragrance. This perfume gives off a heady & strong whiff. The sensual & bold aroma of this fragrance speaks volumes about your sophisticated choice & charismatic persona.	t	Hindustan Unilever	250	245	f	Axe-Signature-Intense-Strong-Woody-No-Gas-Body-Deodorant-For-Men-154-ml	Perfume, axe perfume, axe intense, axe	6
41	Fogg Body Spray Bleu Skies - 120ml	FOGG is a product of Vini Cosmetics with a punch tagline of “without gas body spray” and “again finished”. It came with a basic USP of long lasting fragrance and guaranteeing 800 sprays for a single FOGG bottle.	t	Vini Cosmetics	230	225	f	Fogg-Body-Spray-Bleu-Skies-120-ml	Fogg, perfume, fragrance, fogg body spray, body spary, perfume without gasses	6
43	Dabur Chyawanprakash Sugarfree	Dabur Chyawanprakash gives you the goodness of Dabur Chyawanprash with no added sugar.	t	Dabur	370	348	f	Dabur-Chyawanprakash-Sugar-free-1-KG	Dabur chyawanprakash sugar free, sugar free chyawanprakash	9
44	Engage W4 Perfume Spray - For Women, 120 ml	A Refreshing fragrance which transports you to a summer day in the towns along the mediterranean coastlin	t	ITC	210	160	f	Engage-W4-Perfume-Spray-For-Women-120-ml	Women perfume, engage perfume, W4 perfume	6
42	Dabur Chyawanprash 2X Immunity	Dabur Chyawanprash boosts the ability to fight illnesses*\r\nDabur Chyawanprash is a daily dose for your family to build Strength & Stamina\r\nIt fights illness* with the power of double immunity – (*Illness refers to common day to day infections and allergies)	t	Dabur	350	340	f	Dabur-Chyawanprash-2X-Immunity	Dabur, chyawanprash, immunity booster	9
45	Colgate Toothpaste Dental Paste for oral hygiene	Enables oral hygiene\r\nKills bacteria and germs\r\nEnables fresh breath	t	Colgate	52	50	f	Colgate-Toothpaste-Dental-Paste-for-oral-hygiene	Colgate, dental paste, oral hygiene, 100gm colgate paste	10
46	Sensodyne Sensitive Toothpaste - 40g (Sensodyne)	Sensodyne Fresh Mint works deep inside the tooth to soothe painful tooth sensitivity* and helps keep sensitive teeth pain from coming back. Sensodyne Fresh Mint toothpaste also has a mild mint flavor that keeps your mouth feeling fresh and clean.	t	glaxosmithkline	70	70	f	Sensodyne-Sensitive-Toothpaste-40g-Sensodyne	Sensodyne, fresh mint, toothpaste, glaxosmithkline	10
47	Sensodyne Sensitive Toothpaste - 150g  (Sensodyne)	Sensodyne Fresh Mint works deep inside the tooth to soothe painful tooth sensitivity* and helps keep sensitive teeth pain from coming back. Sensodyne Fresh Mint toothpaste also has a mild mint flavor that keeps your mouth feeling fresh and clean.	t	glaxosmithkline	248	240	f	Sensodyne-Sensitive-Toothpaste-150g-Sensodyne	Sensodyne, fresh mint, toothpaste, glaxosmithkline, 150gm sensodyne toothpaste	10
48	Dabur Babool Ayurvedic Toothpaste 100gm (Dabur)	Babul's astringent action tightens the gums, protecting against gum swelling and all manner of gum diseases.\r\nClove oil is antibacterial and helps fight off germs that cause cavities.\r\nRefreshes you with a minty taste.	t	Dabur	50	50	f	DaburBabool-Ayurvedic-Toothpaste-100-gm-Dabur	Dabur Babool, toothpaste, toothpaste 100gm	10
49	Dentosys Herbal Toothpaste Oral Hygiene (Dr. Morepen)	herbs and some ayurvedic ingredients. It improves the health of the teeth and gums. It helps to protect the teeth and gums from infections. Regular brushing of teeth using this toothpaste can help to prevent cavities in the tooth.	t	Dr Morepen	48	48	f	Dentosys-Herbal-Toothpaste-Oral-Hygiene-Dr-Morepen	Herbal toothpaste, Dr morepen, Dentosys Herbal Toothpaste,  Oral Hygiene (Dr. Morepen)	10
50	Dabur Meswak Toothpaste (100gm)	Dabur Meswak provides Complete Oral Care: Fights Tartar & Plaque, Protection from Cavities, Fights Tooth Decay, Fights Germs & Bacteria, Gingival protection & Removes Malodour.	t	Dabur	52	50	f	Dabur-Meswak-Toothpaste-100gm	dabur toothpaste, meswak, meswak 100gm toothpaste,herbal toothpaste	10
51	Emoform Oral Hygiene  Toothpaste (100gm)	The multi-action toothpaste for Inflamed, Bleeding gums and Sensitive teeth.\r\nIndications:\r\nInflamed and bleeding gums, plaque prevention and sensitivity relief	t	J L Morison	130	125	f	Emoform-Oral-Hygiene-Toothpaste-100gm	Toothpaste, emoform toothpaste	10
52	Pepsodent Germi Check 100gm Oral Hygiene Toothpaste(100 gm)	Enables Fresh Breath\r\nHelps in frightening bacteria\r\nTightens gums	t	Unilever	52	50	f	Pepsodent-Germi-Check-100-gm-Oral-Hygiene-Toothpaste-100-gm	Pepsodent, toothpaste, pepsodent germi check,	10
53	Colgate Max Fresh Toothpaste for Fresh Breath(100gm)	Oral Hygiene\r\nSuper Fresh Breath\r\nFights Cavity	t	Colgate	92	80	f	Colgate-Max-Fresh-Toothpaste-for-Fresh-Breath-100-gm	Colgate Max fresh, max fresh	10
54	Himalaya Sparkling White Herbal Toothpaste 80 gm	Himalaya's sparkling white toothpaste is a breakthrough herbal formulation based on plant enzyme technology that gently removes surface stains on your teeth. It contains papain and bromelain, enzymes present in papaya and annanasa pineapple, which safely whiten teeth.	t	Himalaya	55	52	f	Himalaya-Sparkling-White-Herbal-Toothpaste-80-gm	Himalaya Sparkling White Herbal Toothpaste 80 gm, Himalaya toothpaste, herbal toothpaste	10
56	Patanjali Dant Kanti Ayurvedic Toothpaste (100 gm)	Fights Germs \r\nKill bad breath\r\nTightens Gums	t	Patanjali	45	45	f	Patanjali-Dant-Kanti-Ayurvedic-Toothpaste-100-gm	Patanjali toothpaste, Ayurvedic toothpase, dant kanti	10
57	XTAR  Toothpaste	Xtar toothpaste contains Potassium pyrophosphate, sodium Pyrophosphate and Sodium fluoride. Xtar toothpaste is a specialized toothpaste for calculus prone patients hence  it is recommended only as a toothpaste for calculus control.\r\nPyrophosphates (crystal growth inhibitor) removes calcium from the saliva to form a soluble complex that can be rinsed away with water thereby controlling new calculus built up.	t	ICPA Heath Products Ltd	100	97	f	XTAR-Calculus-control-Toothpaste	XTAR, tar tar removal toothpase, xtar calulus control toothpaste	10
58	Colgate Total Multi Benefit Toothpaste (120 gm)	Colgate Total Advanced Health is an antibacterial toothpaste with dual zinc and arginine technology that actively seeks out bacteria and fights germs on teeth, tongue, cheeks, and gums, giving you Whole Mouth Clean for 12 hours	t	Colgate	80	83	f	Colgate-Total-Multi-Benefit-Toothpaste-120-gm	Colgate total, toothpaste	10
59	Closeup Fresh Breath Toothpaste 80 gm	Closeup Red Hot Everfresh+ Gel Toothpaste now in Triple Fresh Formula harnesses the combined power of 3 components keeping you protected and fresh\r\nAnti-germ mouthwash formula that effectively fights up to 99% of germs\r\nPurifying Gel that cleans to the deepest corners of your mouth	t	Closeup	40	40	f	Closeup-Fresh-Breath-Toothpaste-80-gm	close up toothpaste, toothpaste, fresh breath toothpaste	10
60	Closeup Fresh Breath Toothpaste 150 gm	Closeup Red Hot Everfresh+ Gel Toothpaste now in Triple Fresh Formula harnesses the combined power of 3 components keeping you protected and fresh\r\nAnti-germ mouthwash formula that effectively fights up to 99% of germs\r\nPurifying Gel that cleans to the deepest corners of your mouth	t	Closeup	85	80	f	Closeup-Fresh-Breath-Toothpaste-150-gm	closeup 150gm toothpaste, closeup fresh breath toothpaste	10
55	Himalaya Sparkling  White Herbal Toothpaste 100 Gm	Himalaya's sparkling white toothpaste is a breakthrough herbal formulation based on plant enzyme technology that gently removes surface stains on your teeth. It contains papain and bromelain, enzymes present in papaya and annanasa pineapple, which safely whiten teeth.	t	Himalaya	65	60	f	Himalaya-Sparkling-White-Herbal-Toothpaste-100-Gm	Himalaya toothpaste, herbal toothpaste, himalaya 100 gm toothpaste	10
62	Glow & Lovely (Fair &Lovely)  100 gm	Fair and Lovely Advanced Multi Vitamin cream works like a face polish treatment, which often used to treat sun tanning. The SPF 15 Fair & Lovely Advanced Multi Vitamin product...	t	Hindustan Unilever	190	185	f	Glow-Lovely-Fair-Lovely-100-gm	Fair and Loverly, face cream	11
61	Glow & Lovely (Fair &Lovely) 25gm	Skin lightening cream	t	Hindustan Unilever	55	50	f	Glow-Lovely-Fair-Lovely-25-gm	Fair and lovely, glow and lovely face cream, face cream	11
63	Fair & Lovely Ayurvedic Care Face Cream 25gm	Fair & Lovely Ayurvedic Fairness Cream gives you fairer skin infused with the goodness of Kumkumadi Tailam, Fair & Lovely Ayurvedic Care has 16 ingredients which are known to- Lodhra, Khas, Neelotpal – calm and soothe skin. ... It gives you Natural Fairness, Balanced skin tone and Rejuvenated skin.	t	Hindustan Unilever	65	62	f	Fair-Lovely-Ayurvedic-Care-Face-Cream-25-gm	fair and lovely, ayurvedic face cream	11
65	Fair and Handsome cream for men 60 gm	it helps transform men's tough skin and delivers 4 powerful benefits-Visible Radiance, reduces and controls excess oil on face, sun protection against harmful UVA/ UVB rays and gives youthful look	t	Emami	130	125	f	Fair-and-Handsome-cream-for-men-60-gm	men face cream, emami fair and handsome, face cream for men	11
64	Fair and Handsome cream for men 30gm	it helps transform men's tough skin and delivers 4 powerful benefits-Visible Radiance, reduces and controls excess oil on face, sun protection against harmful UVA/ UVB rays and gives youthful look	t	Emami	75	72	f	Fair-and-Handsome-cream-for-men-30-gm	men face cream, emami fair and handsome, face cream for men	11
66	Fair & Lovely BB  Face Cream 9 gm	The Fair and Lovely BB Cream is a glow cream with a make-up finish. This expert product brings together the benefits of foundation and advanced multivitamin glow cream. Its suitable for all Indian skin tones. Use it daily to hide dark spots and blemishes, and achieve a bright and fresh look every day.	t	Hindustan Unilever	40	38	f	Fair-Lovely-BB-Face-Cream-9-gm	fair and lovely cream, bb cream bb cream 9gm	11
67	Fair & Lovely BB  Face Cream 18 gm	The Fair and Lovely BB Cream is a glow cream with a make-up finish. This expert product brings together the benefits of foundation and advanced multivitamin glow cream. Its suitable for all Indian skin tones. Use it daily to hide dark spots and blemishes, and achieve a bright and fresh look every day.	t	Hindustan Unilever	80	78	f	Fair-Lovely-BB-Face-Cream-18-gm	fair and lovely cream, bb cream bb cream 18 gm	11
68	Fair & Lovely BB  Face Cream 40 gm	The Fair and Lovely BB Cream is a glow cream with a make-up finish. This expert product brings together the benefits of foundation and advanced multivitamin glow cream. Its suitable for all Indian skin tones. Use it daily to hide dark spots and blemishes, and achieve a bright and fresh look every day.	t	Hindustan Unilever	310	310	f	Fair-Lovely-BB-Face-Cream-40-gm	fair and lovely cream, bb cream bb cream 40 gm	11
69	Lakme Complexion Care Face Cream, 9gm	With hectic working hours, you may not have enough time to get ready for a party after the office hours. That’s when this 9 to 5 Complexion Care Cream – Bronze from Lakme will come to your rescue. The bronze shade of this cream can be ideal for people with dusky complexion.\r\n\r\nBrightens your Skin\r\nCombining the goodness of your daily skin cream and just the right touch of make-up, this cream not only brightens your skin but also moisturizes, refreshes, and provides UV protection. You can also use it every day to get styled skin within just a few minutes.\r\n\r\nGets Easily Absorbed\r\nThis cream is light and gets easily absorbed into your skin, thus giving you even skin tone and making your skin look natural. Since it comes in an easy-to-carry tube, you can carry it anywhere you go.	t	Lakme	99	99	f	Lakme-Complexion-Care-Face-Cream-9-gm	Lakme Complexion Care Face Cream, lakhme 9to 5 cream, lakhme complesxion cream	11
70	Lakme Complexion Care Face Cream, 30 gm	With hectic working hours, you may not have enough time to get ready for a party after the office hours. That’s when this 9 to 5 Complexion Care Cream – Bronze from Lakme will come to your rescue. The bronze shade of this cream can be ideal for people with dusky complexion.\r\n\r\nBrightens your Skin\r\nCombining the goodness of your daily skin cream and just the right touch of make-up, this cream not only brightens your skin but also moisturizes, refreshes, and provides UV protection. You can also use it every day to get styled skin within just a few minutes.\r\n\r\nGets Easily Absorbed\r\nThis cream is light and gets easily absorbed into your skin, thus giving you even skin tone and making your skin look natural. Since it comes in an easy-to-carry tube, you can carry it anywhere you go.	t	Lakme	299	280	f	Lakme-Complexion-Care-Face-Cream-30-gm	Lakme Complexion Care Face Cream, lakhme 9to 5 cream, lakhme complesxion cream	11
72	Garnier Men Acno Fight, Anti-Pimple Face Cream 45 gm	Contains natural ingredients to fight against six major acne problems\r\nEffective micro-beads cleansing foam unclogs pores to remove blackheads\r\nRegenerates, repairs and restructures skin for a healthy appearance\r\nThe purifying , an anti-microbial ingredient helps to reduce pimples and secretion of oil, leaving skin free of excessive sebum\r\nA cream that helps fight pimples	t	Garnier	165	160	f	garnier-men-acno-fight-anti-pimple-face-cream	Garnier men face cream, acno fight garnier men face cream	11
71	Pond's BB+ Cream 9Gm	Pond's BB+ Cream is a 2-in-1 formula, which is a combination of fairness cream and lightweight foundation. It helps to give you dual benefits of instant spot coverage and natural glow. Now available in two shades – 01 Original: For light to medium skin tone and 02 Medium: For medium to deep medium skin tone.	t	Unilever	75	73	f	ponds-bb-cream-9gm	ponds cream, ponds bb cream, ponds face cream	11
75	Fortune Soybean Oil 5L	Soybean oil is a vegetable oil extracted from the seeds of the soybean (Glycine max). It is one of the most widely consumed cooking oils and the second most consumed vegetable oil.	t	Adani Wilmar	855	850	f	Fortune-Soybean-Oil-5-L	soyabean oil, refind, soybean oil 5l , refind 5l	12
73	Fortune Mustard oil 1 L	Mustard oil contains essential fatty acids, which help in balancing cholesterol levels. Mustard oil is emerging as the most beneficial oils. Experts suggest that thanks to its ideal ratio of essential fatty acids and natural antioxidants, it may be one of the healthiest edible oils, with huge benefits for the heart.	t	Adani Wilmar	190	204	f	Fortune-Mustard-oil-1-L	Fortune mustard oil, mustard oil, kachhi ghani oil	12
74	Fortune Mustard oil 5 L	Mustard oil contains essential fatty acids, which help in balancing cholesterol levels. Mustard oil is emerging as the most beneficial oils. Experts suggest that thanks to its ideal ratio of essential fatty acids and natural antioxidants, it may be one of the healthiest edible oils, with huge benefits for the heart.	t	Adani Wilmar	1094	990	f	Fortune-Mustard-oil-5-L	Fortune mustard oil, mustard oil, kachhi ghani oil, mustard oil 5l	12
76	Fortune Soybean Oil 1 L	Soybean oil is a vegetable oil extracted from the seeds of the soybean (Glycine max). It is one of the most widely consumed cooking oils and the second most consumed vegetable oil.	t	Adani Wilmar	190	180	f	Fortune-Soybean-Oil-1-L	soyabean oil, refind, soybean oil 1l , refind 1l	12
77	Aashirwad atta 10kg	Aashirwad atta is enriched with Methi and Oats and offered high fiber and protein and low glycemic record. It enhances digestion and keeps your body in good health. It doesn't contain any additional additives or flavors. It is the best incredible source of protein, fiber, iron, and vitamins.	t	ITC	375	350	f	Aashirwad-atta-10-kg	Aashirwad atta 10 kg, aata 10 kg packet	13
78	Aashirwad atta 5 kg	Aashirwad atta is enriched with Methi and Oats and offered high fiber and protein and low glycemic record. It enhances digestion and keeps your body in good health. It doesn't contain any additional additives or flavors. It is the best incredible source of protein, fiber, iron, and vitamins.	t	ITC	230	207	f	Aashirwad-atta-5-kg	Aashirwad atta 5 kg, aata 5 kg ashirvaad	13
79	Rajdhani Besan 1kg	Gram flour or besan is a pulse flour made from a type of ground chickpea called the gram chickpea	t	Rajdhani	105	115	f	Rajdhani-Besan-1-kg	Rajdhani Besan 1kg , besan, rajdhani besan	13
80	Rajdhani Besan 500 gm	Gram flour or besan is a pulse flour made from a type of ground chickpea called the gram chickpea.	t	Rajdhani	60	54	f	Rajdhani-Besan-500-gm	Rajdhani Besan 1kg , besan, rajdhani besan	13
81	Rakesh Besan 500 gm	Rakesh Besan is known to have very low levels of glycemic in it, which is great for those who have high diabetes.Besan flour is highly nutritious and helps the body with immense benefits, especially when fighting allergies of any kinds.	t	Rakesh Group	55	50	f	Rakesh-Besan-500-gm	Rakesh besan 500gm, besan	13
82	Tata Tea Premium 100gm	Enhances your eye health.\r\nReduces your risk of stroke.\r\nSharpens your memory.\r\nPrevents tooth decay.\r\nImproves your digestion.\r\nReduces your blood pressure.\r\nStrengthens your immune system.\r\nCurbs your stress and anxiety.	t	Tata	35	35	f	Tata-Tea-Premium-100-gm	Tea, tata tea, tata tea premium 100gm	14
83	Tata Tea Premium 250gm	Enhances your eye health.\r\nReduces your risk of stroke.\r\nSharpens your memory.\r\nPrevents tooth decay.\r\nImproves your digestion.\r\nReduces your blood pressure.\r\nStrengthens your immune system.\r\nCurbs your stress and anxiety.	t	Tata	120	120	f	Tata-Tea-Premium-250-gm	Tata Tea Premium 250gm, tata 250 gm tea, tata tea	14
84	Tata Tea Premium 1kg	Enhances your eye health.\r\nReduces your risk of stroke.\r\nSharpens your memory.\r\nPrevents tooth decay.\r\nImproves your digestion.\r\nReduces your blood pressure.\r\nStrengthens your immune system.\r\nCurbs your stress and anxiety.	t	Tata	470	450	f	Tata-Tea-Premium-1-kg	Tata Tea Premium 1kg, tata tea, tata tea 1kg	14
85	Tata Tea Agni 250 gm	Start your mornings with this wonderful Tata Agni Leaf Tea. Even during work hours or at night, a cup of this tea is just the kick your brain needs. Its made from the finest quality of tea leaves, so that you get a product that combines quality and affordability at the same time. So go ahead, Buy Tata Agni Leaf Tea online today!	t	Tata	80	75	f	Tata-Tea-Agni-250-gm	Tea, tata tea, tata tea premium 100gm, tata tea agni 250gm	14
86	Brooke Bond Red Label Tea 250gm	Premium Blend\r\nHigh quality blend of tea rich in taste	t	Brooke Bond	120	115	f	Brooke-Bond-Red-Label-Tea-250-gm	red label tea, brooke bond red level tea, red label tea 250gm	14
87	Brooke Bond Taaza Tea, 250gm	Taaza has high quality fresh green leaves packed with the natural goodness of theanine, which is naturally present in tea leaves, is one of the best known sources of refreshment that clears your mind instantly	t	Brooke Bond	80	80	f	Brooke-Bond-Taaza-Tea-250-gm	Brooke Bond Taaza Tea, 250gm, taaza 250gm	14
88	Brooke Bond Taaza Tea, 100gm	Taaza has high quality fresh green leaves packed with the natural goodness of theanine, which is naturally present in tea leaves, is one of the best known sources of refreshment that clears your mind instantly	t	Brooke Bond	25	25	f	Brooke-Bond-Taaza-Tea-100-gm	Brooke Bond Taaza Tea, 100gm, taaza 100gm	14
89	Today Star Tea-200 gm	it energies your body \r\nHelp in waking up in morning	t	Today	60	60	f	Today-Star-Tea-200-gm	Today Star Tea-200 gm, today star tea	14
90	BRU Instant Coffee Powder ₹10 packet	You could live longer. ...\r\nYour body may process glucose (or sugar) better. ...\r\nYou're less likely to develop heart failure. ...\r\nYou are less likely to develop Parkinson's disease. ...\r\nYour liver will thank you. ...\r\nYour DNA will be stronger.	t	Bru	10	10	f	BRU-Instant-Coffee-Powder-10-packet	BRU-Instant-Coffee-Powder-10-packet, bru coffee	14
91	Nescafe Classic Coffee ₹10 packet	You could live longer. ...\r\nYour body may process glucose (or sugar) better. ...\r\nYou're less likely to develop heart failure. ...\r\nYou are less likely to develop Parkinson's disease. ...\r\nYour liver will thank you. ...\r\nYour DNA will be stronger.	t	Nescafe	10	10	f	Nescafe-Classic-Coffee-10-packet	coffee, nescafe coffee	14
92	Cadbury Bournvita Inner Strength 200 Gm	Vitamins B9 and B12 provides the essential component to your body for proper growth of red blood cells.\r\nIt elevates the capacity of physical endurance and also the immunity of the body.\r\nIt boosts your energy level and keeps you energetic throughout the day.	t	Cadbury	115	110	f	Cadbury-Bournvita-Inner-Strength-200-Gm	Cadbury Bournvita Inner Strength 250 Gm, bournvita 200gm, bournvita	15
93	Cadbury Bournvita Inner Strength 500 Gm	Vitamins B9 and B12 provides the essential component to your body for proper growth of red blood cells.\r\nIt elevates the capacity of physical endurance and also the immunity of the body.\r\nIt boosts your energy level and keeps you energetic throughout the day.	t	Cadbury	215	210	f	Cadbury-Bournvita-Inner-Strength-500-Gm	Cadbury Bournvita Inner Strength 500 Gm,  bournvita	15
94	Cadbury Bournvita Inner Strength 1Kg	Vitamins B9 and B12 provides the essential component to your body for proper growth of red blood cells.\r\nIt elevates the capacity of physical endurance and also the immunity of the body.\r\nIt boosts your energy level and keeps you energetic throughout the day.	t	Cadbury	420	405	f	Cadbury-Bournvita-Inner-Strength-1-Kg	Cadbury Bournvita Inner Strength 1Kg,	15
95	Cadbury Bournvita Inner Strength 75 Gm	Vitamins B9 and B12 provides the essential component to your body for proper growth of red blood cells.\r\nIt elevates the capacity of physical endurance and also the immunity of the body.\r\nIt boosts your energy level and keeps you energetic throughout the day.	t	Cadbury	30	30	f	Cadbury-Bournvita-Inner-Strength-75-Gm	Cadbury Bournvita Inner Strength 75 Gm, cadbury bournvita packet	15
96	Horlicks Health  Drink - Chocolate Flavour, 500 gm	Health Drink that has nutrients to support immunity.\r\nClinically proven to improve 5 signs of growth\r\nClinically proven to make kids Taller, Stronger & Sharper\r\nScientifically proven to improve Power of Milk	t	Horlicks	235	230	f	Horlicks-Health-Nutrition-Drink-Chocolate-Flavour-500-gm	Horlicks, Horlicks health drink, 500gm horlicks health drink	15
97	Horlicks Health  Drink - Chocolate Flavour,  1Kg	Health Drink that has nutrients to support immunity.\r\nClinically proven to improve 5 signs of growth\r\nClinically proven to make kids Taller, Stronger & Sharper\r\nScientifically proven to improve Power of Milk	t	Horlicks	465	460	f	Horlicks-Health-Drink-Chocolate-Flavour-1Kg	Horlicks, horlicks 1kg	15
98	Glucon-D 500Gm	Glucon D fills you with the energy required to stay active\r\nKick away tiredness and feel rejuvenated with Glucon-D, the preferred choice in summer when the scorching heat drains out body glucose\r\nGlucon D helps to provide instant energy\r\nContains Calcium for bone health	t	Glucon-D	160	150	f	Glucon-D-500-Gm	glucose, glucon d, health drink	15
99	Glucon Nimbu Pani 500Gm	Glucon D fills you with the energy required to stay active\r\nKick away tiredness and feel rejuvenated with Glucon-D, the preferred choice in summer when the scorching heat drains out body glucose\r\nGlucon D helps to provide instant energy\r\nContains Calcium for bone health\r\nEnhances immunity	t	Glucon-D	160	150	f	Glucon-Nimbu-Pani-500-Gm	Glucon Nimbu Pani 500Gm, nimbu pani , glucon d lime	15
100	Catch Hing 10Gm	Hing being rich in fiber aids in digestion. It provides relief from stomach problems like gastritis, bloating, abdominal pain, flatulence and promotes overall digestive health. Due to its anti-microbial properties, it prevents growth of flora in the intestines and reduces the chance of stomach infection.	t	Catch	20	18	f	Catch-Hing-10-Gm	catch hing, hing, 10gm hing	16
101	Catch Hing 25Gm	Hing being rich in fiber aids in digestion. It provides relief from stomach problems like gastritis, bloating, abdominal pain, flatulence and promotes overall digestive health. Due to its anti-microbial properties, it prevents growth of flora in the intestines and reduces the chance of stomach infection.	t	Catch	45	40	f	Catch-Hing-25-Gm	catch hing, catch hing 25gm	16
102	Catch Hing 50Gm	Hing being rich in fiber aids in digestion. It provides relief from stomach problems like gastritis, bloating, abdominal pain, flatulence and promotes overall digestive health. Due to its anti-microbial properties, it prevents growth of flora in the intestines and reduces the chance of stomach infection.	t	Catch	85	80	f	Catch-Hing-50-Gm	catch hing, hing, 50gm hing	16
103	MDH Haldi Powder 100Gm	The curcumin in turmeric has proven, strong anti-inflammatory properties that block the action of inflammatory molecules in the body. Studies show positive effects of curcumin on people suffering from conditions such as rheumatoid arthritis and inflammatory bowel disease, amongst others	t	MDH	30	30	f	MDH-Haldi-Powder-100-Gm	MDH Haldi Powder 100Gm, haldi powder	16
104	Glucon-D 500Gm	it is an energy drink, can be used to enhance energy during summer time	t	Glucon-D	60	55	f	Glucon-D-500-Gm	rootmed	15
\.


--
-- Data for Name: cms_question; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_question (id, ques, answer, product_id) FROM stdin;
\.


--
-- Data for Name: cms_review; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_review (id, rate, comment, product_id, user_id) FROM stdin;
1	1	hdd	61	1
\.


--
-- Data for Name: cms_side_effect; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_side_effect (id, name, summery, product_id) FROM stdin;
\.


--
-- Data for Name: cms_site_information; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_site_information (id, title, description, info1, info2, address, email, admin_email, image, mobile) FROM stdin;
3	Welcome to Gromdy.com! India’s first fast delivery platform for medicine and grocery!	We believe in speed, because you can’t wait several days for medicine and grocery delivery, by feeling the customer’s pain of buying pharmaceutical and grocery we designed a platform where you can find all your daily needs medicines and grocery products online on a website with just 4 clicks your product will be delivered to you within 1 hour of order placed	Gromdy.com provides you with medical information which is curated, written and verified by experts, accurate and trustworthy. Our experts create high-quality content about medicines, diseases, lab investigations, Over-The-Counter (OTC) health products, Ayurvedic herbs/ingredients, and alternative remedies.	no des	H.No:177, Makanpur, indrapuram,\t201014	support@gmail.com	support@gmail.com	noimage.jpg	0000000
2	Gromdy	India's fastest delivery system	we are giving best class medicine at cheaper cost	we are currently operating at Indrapuram Ghaziabad	H.No:177, Makanpur, indrapuram,\t201014	matsl.india@gmail.com	abhishekgupta6322@gmail.com	siteinfo/GROMDY_LOGO_FINAl.png	7838067051
\.


--
-- Data for Name: cms_slider; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_slider (id, name, description, button_name, url_name, image) FROM stdin;
6	Perfumes MEN & WOMEN	Perfume  is a mixture of fragrant essential oils or aroma compounds, fixatives and solvents, usually in liquid form, used to give the human body an agreeable scent.	Pick one for youself	http://ec2-3-14-3-95.us-east-2.compute.amazonaws.com/$$=Axe-Signature-Intense-Strong-Woody-No-Gas-Body-Deodorant-For-Men-154-ml	slider/perfume_front_page_1_1700into1000_edited_for_better_base_visible.png
4	suppliments	Weight Gainer, Proteins, multivitamins of popular brand like Muscleblaze, ON, GNC and many more at affordable cost	explore	http://ec2-3-14-3-95.us-east-2.compute.amazonaws.com/@@=Diabetes	slider/supplements_front_page_1.png
3	Cold and cough	Have cough or cold, pick one we will deliver it to you within a hour	Pick Now	http://ec2-3-14-3-95.us-east-2.compute.amazonaws.com/@@=Cough-and-Cold	slider/medicines_front_page_1.png
8	Grocery	Order your grocery products, we will deliver them in less than 3 hours	Pick your Favorite	http://ec2-3-14-3-95.us-east-2.compute.amazonaws.com/@@=Flours	slider/grocery_front_page_image_1.png
\.


--
-- Data for Name: cms_terms_and_conditions; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_terms_and_conditions (id, term, condition) FROM stdin;
\.


--
-- Data for Name: cms_vendor; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.cms_vendor (id, store, license, city, state, zipcode, address, is_verified, summery, user_id) FROM stdin;
1	Nostore	Nolicense	NOcity	NoStore	NoZipcode	noAddress	t	sdsgsdg	1
2	Nostore	Nolicense	NOcity	NoStore	NoZipcode	noAddress	t	ytutfyt	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-05-11 01:49:13.958552+00	2	abhisekgupta	1	[{"added": {}}]	4	1
2	2021-05-11 01:49:24.280808+00	2	abhisekgupta	2	[{"changed": {"fields": ["Staff status", "Superuser status"]}}]	4	1
3	2021-05-11 01:50:29.747055+00	2	abhisekgupta	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	1
4	2021-05-11 01:50:56.720198+00	1	1 user: abhisekgupta	1	[{"added": {}}]	14	1
5	2021-05-11 01:51:10.25881+00	2	2 user: suchit	1	[{"added": {}}]	14	1
6	2021-05-11 01:53:45.293025+00	1	MADSL	1	[{"added": {}}]	23	1
7	2021-05-11 01:54:07.461638+00	1	MADSL	2	[{"changed": {"fields": ["Image"]}}]	23	1
8	2021-05-11 02:02:04.450845+00	1	MADSL	2	[{"changed": {"fields": ["Email", "Admin email", "Mobile"]}}]	23	2
9	2021-05-11 02:03:19.480365+00	1	MADSL	2	[{"changed": {"fields": ["Image"]}}]	23	2
10	2021-05-11 02:03:20.746543+00	1	MADSL	2	[{"changed": {"fields": ["Image"]}}]	23	2
11	2021-05-11 02:04:09.630988+00	1	term1	1	[{"added": {}}]	25	2
12	2021-05-11 02:05:37.976842+00	1	ukdgkfgfd	1	[{"added": {}}]	24	2
13	2021-05-11 02:06:22.953958+00	1	aboutus	1	[{"added": {}}]	16	2
14	2021-05-11 02:08:23.031692+00	1	super health	1	[{"added": {}}]	20	2
15	2021-05-11 02:09:33.340245+00	1	suppliment	1	[{"added": {}}]	18	2
16	2021-05-11 02:12:01.928651+00	1	korax	1	[{"added": {}}]	22	2
17	2021-05-11 02:13:27.655613+00	1	/media/product/medicine_front_page_png.png	1	[{"added": {}}]	31	2
18	2021-05-11 02:14:07.399134+00	1	noName	1	[{"added": {}}]	32	2
19	2021-05-11 02:17:32.814849+00	2	Ayruvedic	1	[{"added": {}}]	20	2
20	2021-05-11 02:20:15.060355+00	2	Ayruvedic	2	[]	20	2
21	2021-05-11 02:22:27.488687+00	2	Dabur Honey	1	[{"added": {}}]	18	2
22	2021-05-11 02:24:06.463998+00	2	Dabur Honey	3		18	2
23	2021-05-11 02:28:09.759321+00	3	Sweetner	1	[{"added": {}}]	18	2
24	2021-05-11 02:28:15.493576+00	2	Dabur Honey	1	[{"added": {}}]	22	2
25	2021-05-11 02:32:09.25729+00	3	OTC	1	[{"added": {}}]	20	2
26	2021-05-11 02:33:16.982399+00	4	OTC-Table	1	[{"added": {}}]	18	2
27	2021-05-11 02:33:48.561599+00	3	paracip	1	[{"added": {}}]	22	2
28	2021-05-11 02:38:28.306264+00	2	add to bag	1	[{"added": {}}]	24	2
29	2021-05-11 03:27:21.776873+00	1	/media/product/child_data_final.png	2	[{"changed": {"fields": ["Image"]}}]	31	2
30	2021-05-11 03:30:57.480626+00	1	/media/product/pampers_final.png	2	[{"changed": {"fields": ["Image"]}}]	31	2
31	2021-05-11 03:35:04.792886+00	1	fast delivery	1	[{"added": {}}]	17	2
32	2021-05-11 03:36:38.189668+00	1	best product	1	[{"added": {}}]	21	2
33	2021-05-11 03:37:01.341306+00	1	best product	1	[{"added": {}}]	30	2
34	2021-05-11 03:37:26.358513+00	2	best product	1	[{"added": {}}]	30	2
35	2021-05-11 03:56:44.356987+00	1	mEjPOBtY -- packed	1	[{"added": {}}]	11	2
36	2021-05-11 04:04:37.583197+00	1	kora pill	2	[{"changed": {"fields": ["Name", "Url slug"]}}]	22	2
37	2021-05-11 04:50:29.368444+00	1	best product	3		21	2
38	2021-05-11 04:50:56.064718+00	1	/media/product/pampers_final.png	3		31	2
39	2021-05-11 04:51:08.223666+00	1	noName	3		32	2
40	2021-05-11 04:51:49.181591+00	1	fast delivery	3		17	2
41	2021-05-11 04:52:07.271171+00	1	aboutus	3		16	2
42	2021-05-11 04:52:47.297823+00	2	add to bag	3		24	2
43	2021-05-11 04:52:47.29978+00	1	ukdgkfgfd	3		24	2
44	2021-05-11 04:53:19.937967+00	1	MADSL	3		23	2
45	2021-05-11 04:54:15.149956+00	2	abhishekgupta63221422@gmail.com1	3		8	2
46	2021-05-11 04:54:26.39611+00	1	abhisekgupta1	3		8	2
47	2021-05-11 04:55:13.759832+00	4	abhishekgupta63221422@gmail.com1	3		15	2
48	2021-05-11 04:55:21.85207+00	1	abhisekgupta1	3		15	2
49	2021-05-11 04:55:49.014627+00	4	OTC-Table	3		18	2
50	2021-05-11 04:55:49.016684+00	3	Sweetner	3		18	2
51	2021-05-11 04:55:49.018102+00	1	suppliment	3		18	2
52	2021-05-11 04:56:00.185972+00	1	suchit chouhan	3		19	2
53	2021-05-11 04:56:20.678452+00	3	OTC	3		20	2
54	2021-05-11 04:56:20.68065+00	2	Ayruvedic	3		20	2
55	2021-05-11 04:56:20.681912+00	1	super health	3		20	2
56	2021-05-11 04:57:28.449083+00	1	term1	3		25	2
57	2021-05-11 05:00:06.499713+00	4	Allopathic	1	[{"added": {}}]	20	2
58	2021-05-11 05:03:07.715989+00	5	Ayurvedic	1	[{"added": {}}]	20	2
59	2021-05-11 05:04:05.579299+00	6	Homeopathy	1	[{"added": {}}]	20	2
60	2021-05-11 05:06:33.868152+00	7	Popular categories	1	[{"added": {}}]	20	2
61	2021-05-11 05:22:52.179011+00	5	Covid Essentials	1	[{"added": {}}]	18	2
62	2021-05-11 05:28:21.093088+00	4	Instant Hand Sanitizer	1	[{"added": {}}]	22	2
63	2021-05-11 05:35:26.512498+00	2	/media/product/Dettol_sanitizers_01.png	1	[{"added": {}}]	31	2
64	2021-05-11 05:35:48.002757+00	3	/media/product/Dettol_sanitizers_02.png	1	[{"added": {}}]	31	2
65	2021-05-11 05:36:15.892455+00	4	/media/product/Dettol_sanitizers_03.png	1	[{"added": {}}]	31	2
66	2021-05-11 05:38:42.023625+00	5	/media/product/Dettol_sanitizers_04.png	1	[{"added": {}}]	31	2
67	2021-05-11 05:43:37.647164+00	5	Masks	1	[{"added": {}}]	22	2
68	2021-05-11 05:53:52.419688+00	6	/media/product/masks_01.png	1	[{"added": {}}]	31	2
69	2021-05-11 05:55:09.733572+00	7	/media/product/masks_02.png	1	[{"added": {}}]	31	2
70	2021-05-11 05:55:20.587186+00	8	/media/product/masks_03.png	1	[{"added": {}}]	31	2
71	2021-05-11 05:55:33.409069+00	9	/media/product/masks_4.png	1	[{"added": {}}]	31	2
72	2021-05-11 06:02:46.450005+00	6	Gloves	1	[{"added": {}}]	22	2
73	2021-05-11 06:03:42.237679+00	6	Gloves	2	[{"changed": {"fields": ["Keyword"]}}]	22	2
74	2021-05-11 06:04:01.184562+00	10	/media/product/Globes_2.png	1	[{"added": {}}]	31	2
75	2021-05-11 06:04:12.904443+00	11	/media/product/Globes_2_urUE4dh.png	1	[{"added": {}}]	31	2
76	2021-05-11 06:04:29.850648+00	11	/media/product/Globes_2_urUE4dh.png	3		31	2
77	2021-05-11 06:04:47.588498+00	12	/media/product/Globes_1.png	1	[{"added": {}}]	31	2
78	2021-05-11 06:04:59.812594+00	13	/media/product/Globes_3.png	1	[{"added": {}}]	31	2
79	2021-05-11 06:16:02.286488+00	7	Thermometer	1	[{"added": {}}]	22	2
80	2021-05-11 06:16:20.525785+00	14	/media/product/thermometer_01.png	1	[{"added": {}}]	31	2
81	2021-05-11 06:16:42.474112+00	15	/media/product/thermometer_02.png	1	[{"added": {}}]	31	2
82	2021-05-11 06:16:55.853638+00	16	/media/product/thermometer_03.png	1	[{"added": {}}]	31	2
83	2021-05-11 06:17:12.189096+00	17	/media/product/thermometer_04.png	1	[{"added": {}}]	31	2
84	2021-05-11 06:17:27.049315+00	18	/media/product/thermometer_05.png	1	[{"added": {}}]	31	2
85	2021-05-11 06:27:32.765804+00	8	Immunity Booster	1	[{"added": {}}]	22	2
86	2021-05-11 06:27:52.356956+00	19	/media/product/immunity_booster_1.png	1	[{"added": {}}]	31	2
87	2021-05-11 06:28:11.964389+00	20	/media/product/immunity_booster_2.png	1	[{"added": {}}]	31	2
88	2021-05-11 06:28:23.192325+00	20	/media/product/immunity_booster_3.png	2	[{"changed": {"fields": ["Image"]}}]	31	2
89	2021-05-11 06:28:34.998899+00	21	/media/product/immunity_booster_4.png	1	[{"added": {}}]	31	2
90	2021-05-11 06:29:13.594321+00	22	/media/product/immunity_booster_4_CNzFvtS.png	1	[{"added": {}}]	31	2
91	2021-05-11 06:29:37.722871+00	22	/media/product/immunity_booster_4_CNzFvtS.png	3		31	2
92	2021-05-11 06:30:03.201381+00	23	/media/product/immunity_booster_2.png	1	[{"added": {}}]	31	2
93	2021-05-11 06:39:09.919548+00	9	Floor Cleaner	1	[{"added": {}}]	22	2
94	2021-05-11 06:39:44.078833+00	24	/media/product/floor_cleaners.png	1	[{"added": {}}]	31	2
95	2021-05-11 06:39:56.536222+00	24	/media/product/floor_cleaners_01.png	2	[{"changed": {"fields": ["Image"]}}]	31	2
96	2021-05-11 06:40:03.225222+00	24	/media/product/floor_cleaners_02.png	2	[{"changed": {"fields": ["Image"]}}]	31	2
97	2021-05-11 06:40:09.330708+00	24	/media/product/floor_cleaners_03.png	2	[{"changed": {"fields": ["Image"]}}]	31	2
98	2021-05-11 06:40:16.87367+00	24	/media/product/floor_cleaners_04.png	2	[{"changed": {"fields": ["Image"]}}]	31	2
99	2021-05-11 06:40:22.977701+00	24	/media/product/floor_cleaners_05.png	2	[{"changed": {"fields": ["Image"]}}]	31	2
100	2021-05-11 06:40:25.97376+00	24	/media/product/floor_cleaners_05.png	2	[]	31	2
101	2021-05-11 06:40:49.383449+00	25	/media/product/floor_cleaners.png	1	[{"added": {}}]	31	2
102	2021-05-11 06:40:57.390043+00	26	/media/product/floor_cleaners_01.png	1	[{"added": {}}]	31	2
103	2021-05-11 06:41:05.960482+00	27	/media/product/floor_cleaners_02.png	1	[{"added": {}}]	31	2
104	2021-05-11 06:41:13.801194+00	28	/media/product/floor_cleaners_03.png	1	[{"added": {}}]	31	2
105	2021-05-11 06:41:21.521389+00	29	/media/product/floor_cleaners_04.png	1	[{"added": {}}]	31	2
106	2021-05-11 07:01:26.148106+00	6	Personal care	1	[{"added": {}}]	18	2
107	2021-05-11 07:03:29.008023+00	10	olay	1	[{"added": {}}]	22	2
108	2021-05-11 07:11:05.458724+00	30	/media/product/cream_1.png	1	[{"added": {}}]	31	2
109	2021-05-11 07:11:11.021092+00	30	/media/product/cream_1.png	2	[]	31	2
110	2021-05-11 07:11:18.827897+00	31	/media/product/cream_2.png	1	[{"added": {}}]	31	2
111	2021-05-11 07:11:40.752865+00	32	/media/product/cream_3.png	1	[{"added": {}}]	31	2
112	2021-05-11 07:11:49.361221+00	33	/media/product/cream_4.png	1	[{"added": {}}]	31	2
113	2021-05-11 07:11:58.495738+00	34	/media/product/cream_5.png	1	[{"added": {}}]	31	2
114	2021-05-11 07:20:40.806451+00	11	L'Oreal Paris Skin Perfect	1	[{"added": {}}]	22	2
115	2021-05-11 07:20:58.475346+00	35	/media/product/cream_11.png	1	[{"added": {}}]	31	2
116	2021-05-11 07:21:06.370048+00	35	/media/product/cream_12.png	2	[{"changed": {"fields": ["Image"]}}]	31	2
117	2021-05-11 07:21:27.205072+00	35	/media/product/cream_11.png	2	[{"changed": {"fields": ["Image"]}}]	31	2
118	2021-05-11 07:21:50.46364+00	36	/media/product/cream_14.png	1	[{"added": {}}]	31	2
119	2021-05-11 07:22:08.672697+00	37	/media/product/cream_12.png	1	[{"added": {}}]	31	2
120	2021-05-11 07:24:12.563034+00	38	/media/product/cream_132.png	1	[{"added": {}}]	31	2
121	2021-05-11 07:33:04.807561+00	12	Lakme youth infinity	1	[{"added": {}}]	22	2
122	2021-05-11 07:33:28.605674+00	39	/media/product/cream_21.png	1	[{"added": {}}]	31	2
123	2021-05-11 07:38:56.695581+00	40	/media/product/cream_22.png	1	[{"added": {}}]	31	2
124	2021-05-11 07:39:06.661302+00	41	/media/product/cream_23.png	1	[{"added": {}}]	31	2
125	2021-05-11 07:39:17.399233+00	42	/media/product/cream_24.png	1	[{"added": {}}]	31	2
126	2021-05-11 07:39:27.553653+00	43	/media/product/cream_25.png	1	[{"added": {}}]	31	2
127	2021-05-11 07:39:37.457114+00	44	/media/product/cream_25_48eip3o.png	1	[{"added": {}}]	31	2
128	2021-05-11 07:40:09.847872+00	43	/media/product/cream_25.png	3		31	2
129	2021-05-11 08:56:31.124376+00	13	Himalaya Face Cream	1	[{"added": {}}]	22	2
130	2021-05-11 08:56:53.654543+00	45	/media/product/himalaya_face_cream_1.png	1	[{"added": {}}]	31	2
131	2021-05-11 08:57:02.788971+00	46	/media/product/himalaya_face_cream_2.png	1	[{"added": {}}]	31	2
132	2021-05-11 08:57:12.406541+00	47	/media/product/himalaya_face_cream_3.png	1	[{"added": {}}]	31	2
133	2021-05-11 09:08:22.024547+00	14	Nivea Men Intensive Moisturising Cream 50 ml	1	[{"added": {}}]	22	2
134	2021-05-11 09:08:47.623433+00	48	/media/product/nivea_men_cream_01.png	1	[{"added": {}}]	31	2
135	2021-05-11 09:09:00.262157+00	49	/media/product/nivea_men_cream_02.png	1	[{"added": {}}]	31	2
136	2021-05-11 09:09:14.275472+00	50	/media/product/nivea_men_cream_04.png	1	[{"added": {}}]	31	2
137	2021-05-11 09:09:27.760032+00	51	/media/product/nivea_men_cream_03.png	1	[{"added": {}}]	31	2
138	2021-05-11 09:09:38.696329+00	52	/media/product/nivea_men_cream_05.png	1	[{"added": {}}]	31	2
139	2021-05-11 09:18:23.803399+00	15	Himalaya Men Natural Bright Face Cream – SPF 15	1	[{"added": {}}]	22	2
140	2021-05-11 09:18:41.690897+00	53	/media/product/himalaya_face_men_01.png	1	[{"added": {}}]	31	2
141	2021-05-11 09:18:50.806746+00	54	/media/product/himalaya_face_men_02.png	1	[{"added": {}}]	31	2
142	2021-05-11 09:19:02.79498+00	55	/media/product/himalaya_face_men_03.png	1	[{"added": {}}]	31	2
143	2021-05-11 09:19:12.394522+00	56	/media/product/himalaya_face_men_04.png	1	[{"added": {}}]	31	2
144	2021-05-11 09:19:22.200645+00	57	/media/product/himalaya_face_men_05.png	1	[{"added": {}}]	31	2
145	2021-05-11 09:29:01.227239+00	16	Himalaya Men Face & Beard Wash 80ml	1	[{"added": {}}]	22	2
146	2021-05-11 09:29:25.522417+00	58	/media/product/himalaya_face_and_beardo_wash__1.png	1	[{"added": {}}]	31	2
147	2021-05-11 09:29:37.209225+00	59	/media/product/himalaya_face_and_beardo_wash__2.png	1	[{"added": {}}]	31	2
148	2021-05-11 09:29:53.142534+00	60	/media/product/himalaya_face_and_beardo_wash_5.png	1	[{"added": {}}]	31	2
149	2021-05-11 09:30:03.024882+00	61	/media/product/himalaya_face_and_beardo_wash__3.png	1	[{"added": {}}]	31	2
150	2021-05-11 10:38:32.607877+00	17	NIVEA Women Purifying Face Wash, for Oily Skin, 150 ml	1	[{"added": {}}]	22	2
151	2021-05-11 10:38:58.020402+00	62	/media/product/nivie_face_wash_women_01.png	1	[{"added": {}}]	31	2
152	2021-05-11 10:39:11.234836+00	63	/media/product/nivie_face_wash_women_02.png	1	[{"added": {}}]	31	2
153	2021-05-11 10:39:21.699644+00	64	/media/product/nivie_face_wash_women_03.png	1	[{"added": {}}]	31	2
154	2021-05-11 10:48:15.710603+00	18	Himalaya Purifying Neem Face Wash, 50 ml	1	[{"added": {}}]	22	2
155	2021-05-11 10:48:44.025532+00	65	/media/product/himalaya_neem_face_wash1.png	1	[{"added": {}}]	31	2
156	2021-05-11 10:49:00.769586+00	66	/media/product/himalaya_neem_face_wash2.png	1	[{"added": {}}]	31	2
157	2021-05-11 10:49:11.49918+00	67	/media/product/himalaya_neem_face_wash3.png	1	[{"added": {}}]	31	2
158	2021-05-11 10:49:22.169984+00	68	/media/product/himalaya_neem_face_wash5.png	1	[{"added": {}}]	31	2
159	2021-05-11 10:49:31.491035+00	69	/media/product/himalaya_neem_face_wash.png	1	[{"added": {}}]	31	2
160	2021-05-11 11:10:54.165524+00	19	Cinthol Lime Bath Soap, 100g	1	[{"added": {}}]	22	2
161	2021-05-11 11:11:12.415492+00	70	/media/product/cinthol_soap_1.png	1	[{"added": {}}]	31	2
162	2021-05-11 11:11:20.384029+00	71	/media/product/cinthol_soap_2.png	1	[{"added": {}}]	31	2
163	2021-05-11 11:11:28.82059+00	72	/media/product/cinthol_soap_3.png	1	[{"added": {}}]	31	2
164	2021-05-11 11:11:37.571563+00	73	/media/product/cinthol_soap_lime_4.png	1	[{"added": {}}]	31	2
165	2021-05-11 11:11:45.447297+00	74	/media/product/cinthol_soap_lime_5.png	1	[{"added": {}}]	31	2
166	2021-05-11 11:22:09.661337+00	2	Matsl	1	[{"added": {}}]	23	2
167	2021-05-11 11:23:00.055341+00	1	Nostore	1	[{"added": {}}]	26	1
168	2021-05-11 11:23:03.182304+00	2	Matsl	2	[{"changed": {"fields": ["Image"]}}]	23	2
169	2021-05-11 11:27:35.943747+00	1	suchit	1	[{"added": {}}]	33	1
170	2021-05-11 11:28:12.883836+00	2	Nostore	1	[{"added": {}}]	26	1
171	2021-05-11 11:29:08.489072+00	2	abhisekgupta	1	[{"added": {}}]	33	1
172	2021-05-11 12:22:38.641707+00	2	Matsl	2	[{"changed": {"fields": ["Image"]}}]	23	2
173	2021-05-11 12:28:19.201855+00	20	Dabur Amla hair oil 275 ml	1	[{"added": {}}]	22	2
174	2021-05-11 12:30:55.773274+00	75	/media/product/dabur_amla_hair_oil_1.png	1	[{"added": {}}]	31	2
175	2021-05-11 12:36:17.483616+00	76	/media/product/dabur_amla_oil_1_8_8_in.png	1	[{"added": {}}]	31	2
176	2021-05-11 12:36:28.949897+00	77	/media/product/dabur_amla_oil_1_520_360.png	1	[{"added": {}}]	31	2
177	2021-05-11 12:38:02.451357+00	78	/media/product/dabur_amla_oil_1_3.png	1	[{"added": {}}]	31	2
178	2021-05-11 12:53:39.600702+00	21	Clean & Clear Foaming Face Wash For Oily Skin, 150ml	1	[{"added": {}}]	22	2
179	2021-05-11 12:54:04.596013+00	79	/media/product/clean_clear_face_wash_1.png	1	[{"added": {}}]	31	2
180	2021-05-11 12:54:13.180965+00	80	/media/product/clean_clear_face_wash_2.png	1	[{"added": {}}]	31	2
181	2021-05-11 12:54:21.926278+00	81	/media/product/clean_clear_face_wash_3.png	1	[{"added": {}}]	31	2
182	2021-05-11 12:54:30.970395+00	82	/media/product/clean_clear_face_wash_4.png	1	[{"added": {}}]	31	2
183	2021-05-11 12:54:38.879942+00	83	/media/product/clean_clear_face_wash_5.png	1	[{"added": {}}]	31	2
184	2021-05-11 13:06:39.616254+00	22	Bajaj Almond Drops Hair Oil, 200ml	1	[{"added": {}}]	22	2
185	2021-05-11 13:07:00.106423+00	84	/media/product/bajaj_alomnd_hair_oil_2.png	1	[{"added": {}}]	31	2
186	2021-05-11 13:07:08.672725+00	85	/media/product/bajaj_alomnd_hair_oil_1.png	1	[{"added": {}}]	31	2
187	2021-05-11 13:07:17.916294+00	86	/media/product/bajaj_alomnd_hair_oil_5.png	1	[{"added": {}}]	31	2
188	2021-05-11 13:07:27.874334+00	87	/media/product/bajaj_alomnd_hair_oil_4.png	1	[{"added": {}}]	31	2
189	2021-05-11 13:57:19.262754+00	7	Cough and Cold	1	[{"added": {}}]	18	2
190	2021-05-11 13:58:08.154285+00	23	Benadryl DR Syrup 100ml	1	[{"added": {}}]	22	2
191	2021-05-11 13:58:59.577707+00	88	/media/product/benadyrl_dr_01.png	1	[{"added": {}}]	31	2
192	2021-05-11 13:59:21.064447+00	89	/media/product/benadyrl_dr_02.png	1	[{"added": {}}]	31	2
193	2021-05-11 13:59:31.58483+00	90	/media/product/benadyrl_dr_03.png	1	[{"added": {}}]	31	2
194	2021-05-11 13:59:41.761699+00	91	/media/product/benadyrl_dr_05.png	1	[{"added": {}}]	31	2
195	2021-05-11 14:01:58.705004+00	92	/media/product/benadyrl_dr_06.png	1	[{"added": {}}]	31	2
196	2021-05-11 14:41:32.964714+00	24	Cofsils 100ML Syrup	1	[{"added": {}}]	22	2
197	2021-05-11 14:42:26.475414+00	93	/media/product/cofsisls_01.png	1	[{"added": {}}]	31	2
198	2021-05-11 14:42:38.38662+00	94	/media/product/cofsisls_03.png	1	[{"added": {}}]	31	2
199	2021-05-11 14:43:02.306699+00	95	/media/noimage.jpg	1	[{"added": {}}]	31	2
200	2021-05-11 14:45:11.544116+00	95	/media/noimage.jpg	3		31	2
201	2021-05-11 14:45:30.459924+00	96	/media/product/cofsisls__comman_for_all.png	1	[{"added": {}}]	31	2
202	2021-05-11 14:49:50.981063+00	25	COFSILS DRY COUGH Syrup 100ml	1	[{"added": {}}]	22	2
203	2021-05-11 14:50:20.942286+00	97	/media/noimage.jpg	1	[{"added": {}}]	31	2
204	2021-05-11 14:50:34.529333+00	98	/media/product/cofsisls_03_cKtQnwy.png	1	[{"added": {}}]	31	2
205	2021-05-11 14:50:45.505821+00	99	/media/product/cofsisls_dry_wet_cough.png	1	[{"added": {}}]	31	2
206	2021-05-11 14:53:24.262702+00	100	/media/product/cofsisls_dry_cough01.png	1	[{"added": {}}]	31	2
207	2021-05-11 14:53:41.08592+00	101	/media/product/cofsisls_dry_wet_cough_zv5LZaF.png	1	[{"added": {}}]	31	2
208	2021-05-11 14:53:56.635548+00	102	/media/product/cofsisls_03_my3ONRw.png	1	[{"added": {}}]	31	2
209	2021-05-11 14:54:55.374865+00	99	/media/product/cofsisls_dry_wet_cough.png	3		31	2
210	2021-05-11 14:54:55.377196+00	98	/media/product/cofsisls_03_cKtQnwy.png	3		31	2
211	2021-05-11 14:54:55.378719+00	97	/media/noimage.jpg	3		31	2
212	2021-05-11 14:55:16.230108+00	103	/media/product/cofsisls_03_DlSRuP9.png	1	[{"added": {}}]	31	2
213	2021-05-11 14:57:40.041946+00	26	COFSILS WET COUGH Syrup 100ml	1	[{"added": {}}]	22	2
214	2021-05-11 14:58:08.970285+00	104	/media/product/cofsisls_wet_cough_01.png	1	[{"added": {}}]	31	2
215	2021-05-11 14:58:20.992155+00	105	/media/product/cofsisls_03_Jauagcy.png	1	[{"added": {}}]	31	2
216	2021-05-11 15:01:51.494611+00	27	Cofsils Naturals Cough Syrup Bottle Of 100 Ml	1	[{"added": {}}]	22	2
217	2021-05-11 15:02:13.247803+00	106	/media/product/cofsisls_02.png	1	[{"added": {}}]	31	2
218	2021-05-11 15:02:23.90434+00	107	/media/product/cofsisls__comman_for_all_ALr6tIf.png	1	[{"added": {}}]	31	2
219	2021-05-11 15:02:36.082258+00	108	/media/product/cofsisls_03_qYDtBsD.png	1	[{"added": {}}]	31	2
220	2021-05-11 15:04:13.884106+00	96	/media/product/cofsisls__comman_for_all.png	3		31	2
221	2021-05-11 15:04:44.614346+00	94	/media/product/cofsisls_03.png	3		31	2
222	2021-05-11 15:06:46.599923+00	109	/media/product/cofsisls_cough_syrup_01.png	1	[{"added": {}}]	31	2
223	2021-05-11 15:07:29.890993+00	102	/media/product/cofsisls_03_my3ONRw.png	3		31	2
224	2021-05-11 15:07:53.700058+00	110	/media/product/cofsisls_03.png	1	[{"added": {}}]	31	2
225	2021-05-11 17:12:03.639096+00	28	Dabur Honitus Syrup -100ml	1	[{"added": {}}]	22	2
226	2021-05-11 17:12:24.435492+00	111	/media/product/dabur_honitus_1.png	1	[{"added": {}}]	31	2
227	2021-05-11 17:12:37.631594+00	112	/media/product/dabur_honitus_2.png	1	[{"added": {}}]	31	2
228	2021-05-11 17:12:52.208113+00	113	/media/product/dabur_honitus_3.png	1	[{"added": {}}]	31	2
229	2021-05-11 17:12:52.567967+00	114	/media/product/dabur_honitus_3_RblAH0G.png	1	[{"added": {}}]	31	2
230	2021-05-11 17:13:04.166088+00	115	/media/product/dabur_honitus_4.png	1	[{"added": {}}]	31	2
231	2021-05-11 17:13:49.307331+00	116	/media/product/dabur_honitus_5.png	1	[{"added": {}}]	31	2
232	2021-05-11 17:14:11.761474+00	114	/media/product/dabur_honitus_3_RblAH0G.png	3		31	2
233	2021-05-11 17:29:40.255814+00	29	Himalaya Herbal Koflet SF Linctus Syrup 100ml	1	[{"added": {}}]	22	2
234	2021-05-11 17:30:06.2501+00	117	/media/product/himalaya_koflet_1.png	1	[{"added": {}}]	31	2
235	2021-05-11 17:30:18.386723+00	118	/media/product/himalaya_koflet_2.png	1	[{"added": {}}]	31	2
236	2021-05-11 17:31:53.62142+00	119	/media/product/himalaya_koflet_5.png	1	[{"added": {}}]	31	2
237	2021-05-11 17:32:07.248635+00	120	/media/product/himalaya_koflet_3.png	1	[{"added": {}}]	31	2
238	2021-05-11 17:32:17.92931+00	121	/media/product/himalaya_koflet_4.png	1	[{"added": {}}]	31	2
239	2021-05-11 17:42:48.392397+00	2	Sexual wellness	1	[{"added": {}}]	21	2
240	2021-05-11 17:52:45.784491+00	2	Sexual wellness	3		21	2
241	2021-05-11 17:53:54.967903+00	3	Upto 30% off on cough and cold medicines	1	[{"added": {}}]	21	2
242	2021-05-11 17:54:21.188208+00	3	Upto 30% off on cough and cold medicines	1	[{"added": {}}]	30	2
243	2021-05-11 17:54:28.914864+00	4	Upto 30% off on cough and cold medicines	1	[{"added": {}}]	30	2
244	2021-05-11 17:54:36.706575+00	5	Upto 30% off on cough and cold medicines	1	[{"added": {}}]	30	2
245	2021-05-11 17:56:40.964953+00	4	Upto 20% off on sex and wellness products	1	[{"added": {}}]	21	2
246	2021-05-11 18:02:48.733398+00	8	Sex and wellness	1	[{"added": {}}]	18	2
247	2021-05-11 18:03:38.253868+00	30	Durex Extra Time Condoms	1	[{"added": {}}]	22	2
248	2021-05-11 18:04:10.08879+00	122	/media/product/durex_extra_time_1.png	1	[{"added": {}}]	31	2
249	2021-05-11 18:04:19.771438+00	123	/media/product/durex_extra_time_2.png	1	[{"added": {}}]	31	2
250	2021-05-11 18:04:28.484095+00	124	/media/product/durex_extra_time_3.png	1	[{"added": {}}]	31	2
251	2021-05-11 18:04:39.076747+00	125	/media/product/durex_extra_time_4.png	1	[{"added": {}}]	31	2
252	2021-05-11 18:04:48.403627+00	126	/media/product/durex_extra_time_5.png	1	[{"added": {}}]	31	2
253	2021-05-11 18:05:18.277299+00	6	Upto 20% off on sex and wellness products	1	[{"added": {}}]	30	2
254	2021-05-11 18:20:45.071568+00	31	Durex Extra Thin Condom	1	[{"added": {}}]	22	2
255	2021-05-11 18:21:04.353728+00	7	Upto 20% off on sex and wellness products	1	[{"added": {}}]	30	2
256	2021-05-11 18:22:44.387997+00	127	/media/product/durex_extra_thin_1.png	1	[{"added": {}}]	31	2
257	2021-05-11 18:23:00.802468+00	128	/media/product/durex_extra_thin_2.png	1	[{"added": {}}]	31	2
258	2021-05-11 18:23:26.009128+00	129	/media/product/durex_extra_thin_3.png	1	[{"added": {}}]	31	2
259	2021-05-11 18:23:42.643185+00	130	/media/product/durex_extra_thin_4.png	1	[{"added": {}}]	31	2
260	2021-05-11 18:24:58.018476+00	131	/media/product/Durex_comman1.png	1	[{"added": {}}]	31	2
261	2021-05-11 18:25:29.574759+00	132	/media/product/Durex_comman2.png	1	[{"added": {}}]	31	2
262	2021-05-11 18:36:36.352196+00	32	Durex Air Condoms	1	[{"added": {}}]	22	2
263	2021-05-11 18:36:51.629227+00	8	Upto 20% off on sex and wellness products	1	[{"added": {}}]	30	2
264	2021-05-11 18:37:28.325434+00	133	/media/product/Durex_Air_1.png	1	[{"added": {}}]	31	2
265	2021-05-11 18:37:49.475442+00	134	/media/product/Durex_Air_2.png	1	[{"added": {}}]	31	2
266	2021-05-11 18:38:00.959826+00	135	/media/product/Durex_Air_4.png	1	[{"added": {}}]	31	2
267	2021-05-11 18:38:14.956142+00	136	/media/product/Durex_Air_6.png	1	[{"added": {}}]	31	2
268	2021-05-11 18:38:31.059181+00	137	/media/product/Durex_comman1_6cbvzgC.png	1	[{"added": {}}]	31	2
269	2021-05-11 18:38:44.528417+00	138	/media/product/Durex_comman4.png	1	[{"added": {}}]	31	2
270	2021-05-11 18:39:20.744323+00	139	/media/product/Durex_Air_3.png	1	[{"added": {}}]	31	2
271	2021-05-11 18:43:49.83279+00	9	Upto 30% off on cough and cold medicines	1	[{"added": {}}]	30	2
272	2021-05-11 19:20:56.283884+00	9	Diabetes	1	[{"added": {}}]	18	2
273	2021-05-11 19:38:33.638142+00	33	Accu-Chek Active Blood Glucose Meter Kit	1	[{"added": {}}]	22	2
274	2021-05-11 19:39:01.41346+00	140	/media/product/glucometer_1.png	1	[{"added": {}}]	31	2
275	2021-05-11 19:39:12.393023+00	141	/media/product/glucometer_2.png	1	[{"added": {}}]	31	2
276	2021-05-11 19:39:22.960786+00	142	/media/product/glucometer_4.png	1	[{"added": {}}]	31	2
277	2021-05-11 19:39:32.397298+00	143	/media/product/glucometer_5.png	1	[{"added": {}}]	31	2
278	2021-05-11 19:39:42.515161+00	144	/media/product/glucometer_6.png	1	[{"added": {}}]	31	2
279	2021-05-11 19:39:53.871036+00	145	/media/product/glucometer_7.png	1	[{"added": {}}]	31	2
280	2021-05-11 19:40:06.438918+00	146	/media/product/glucometer_8.png	1	[{"added": {}}]	31	2
281	2021-05-11 19:40:15.792112+00	147	/media/product/glucometer_9.png	1	[{"added": {}}]	31	2
282	2021-05-11 19:53:40.536701+00	34	Dr Morepen Gulcometer BG-03 KIT WITH FREE 25 STRIPS	1	[{"added": {}}]	22	2
283	2021-05-11 19:54:00.002457+00	148	/media/product/Dr_morepen_glucometer_1.png	1	[{"added": {}}]	31	2
284	2021-05-11 19:54:11.77696+00	149	/media/product/Dr_morepen_glucometer.png	1	[{"added": {}}]	31	2
285	2021-05-11 19:54:23.152527+00	150	/media/product/Dr_morepen_glucometer_2.png	1	[{"added": {}}]	31	2
286	2021-05-11 19:54:34.115892+00	151	/media/product/Dr_morepen_glucometer_3.png	1	[{"added": {}}]	31	2
287	2021-05-11 19:54:35.688218+00	3	covid	1	[{"added": {}}]	24	1
288	2021-05-11 19:54:44.489659+00	152	/media/product/Dr_morepen_glucometer_4.png	1	[{"added": {}}]	31	2
289	2021-05-11 19:54:55.409353+00	153	/media/product/Dr_morepen_glucometer5.png	1	[{"added": {}}]	31	2
290	2021-05-11 20:00:15.926536+00	4	suppliments	1	[{"added": {}}]	24	1
291	2021-05-11 20:02:22.454759+00	35	Gluco One BG 03 50 Test Strips	1	[{"added": {}}]	22	2
292	2021-05-11 20:03:30.955263+00	154	/media/product/Dr_morepen_glucometer_strips.png	1	[{"added": {}}]	31	2
293	2021-05-11 20:03:46.222496+00	155	/media/product/Dr_morepen_glucometer_strips1.png	1	[{"added": {}}]	31	2
294	2021-05-11 20:04:52.620634+00	8	Upto 20% off on sex and wellness products	3		30	2
295	2021-05-11 20:05:10.4382+00	7	Upto 20% off on sex and wellness products	3		30	2
296	2021-05-11 20:05:10.440297+00	6	Upto 20% off on sex and wellness products	3		30	2
297	2021-05-11 20:09:57.711461+00	4	Upto 20% off on sex and wellness products	3		21	2
298	2021-05-11 20:24:18.747526+00	18	Himalaya Purifying Neem Face Wash 50 ml (Himalaya)	2	[{"changed": {"fields": ["Name", "Url slug"]}}]	22	1
299	2021-05-11 20:25:13.230834+00	35	Gluco One BG 03 50 Test Strips (Dr Morepen)	2	[{"changed": {"fields": ["Name", "Url slug"]}}]	22	1
300	2021-05-11 20:25:38.170161+00	34	Dr Morepen Gulcometer BG-03 KIT WITH FREE 25 STRIPS	2	[]	22	1
301	2021-05-11 20:26:22.635257+00	33	Accu-Chek Active Blood Glucose Meter Kit (Accu-check)	2	[{"changed": {"fields": ["Name", "Url slug"]}}]	22	1
302	2021-05-11 20:27:44.596144+00	32	Durex Air Condoms	2	[]	22	1
303	2021-05-11 20:27:56.784794+00	32	Durex Air Condoms	2	[]	22	1
304	2021-05-11 20:28:14.241976+00	29	Himalaya Herbal Koflet SF Linctus Syrup 100ml	2	[]	22	1
375	2021-05-12 09:47:17.415821+00	6	Diabetic care supplements	1	[{"added": {}}]	21	2
305	2021-05-11 20:28:58.470398+00	27	Cofsils Naturals Cough Syrup Bottle Of 100 Ml (Cipla)	2	[{"changed": {"fields": ["Name", "Url slug"]}}]	22	1
306	2021-05-11 20:30:07.305016+00	26	COFSILS WET COUGH Syrup 100ml (Cipla)	2	[{"changed": {"fields": ["Name"]}}]	22	1
307	2021-05-11 20:51:18.490937+00	36	Sugar Free 100gm	1	[{"added": {}}]	22	2
308	2021-05-11 20:51:44.000226+00	156	/media/product/sugar_free_1.png	1	[{"added": {}}]	31	2
309	2021-05-11 20:51:55.927533+00	157	/media/product/sugar_free_3.png	1	[{"added": {}}]	31	2
310	2021-05-11 20:53:29.691263+00	158	/media/product/sugar_free_5.png	1	[{"added": {}}]	31	2
311	2021-05-11 20:53:44.616656+00	159	/media/product/sugar_free_6.png	1	[{"added": {}}]	31	2
312	2021-05-11 21:03:35.485685+00	37	Sugar Free Gold Pellets, 50 Pellets	1	[{"added": {}}]	22	2
313	2021-05-11 21:03:53.998292+00	160	/media/product/sugar_free_pellet.png	1	[{"added": {}}]	31	2
314	2021-05-11 21:04:06.673474+00	161	/media/product/sugar_free_pellet_1.png	1	[{"added": {}}]	31	2
315	2021-05-11 21:04:19.725919+00	162	/media/product/sugar_free_pellet_2.png	1	[{"added": {}}]	31	2
316	2021-05-11 21:04:30.623751+00	163	/media/product/sugar_free_pellet_2_zFdq3IP.png	1	[{"added": {}}]	31	2
317	2021-05-11 21:04:47.038587+00	164	/media/product/sugar_free_6_Lobjz4i.png	1	[{"added": {}}]	31	2
318	2021-05-11 21:05:05.445773+00	165	/media/product/sugar_free_3_SO7fPQ4.png	1	[{"added": {}}]	31	2
319	2021-05-11 21:28:05.521521+00	38	Abbott Ensure (Glucerna SR) 400gm Vanilla Powder Diabetic Nutrition Therapeutic	1	[{"added": {}}]	22	2
320	2021-05-11 21:28:51.285615+00	166	/media/product/Abbot_diabetic_care_1.png	1	[{"added": {}}]	31	2
321	2021-05-11 21:29:01.746732+00	167	/media/product/Abbot_diabetic_care_2.png	1	[{"added": {}}]	31	2
322	2021-05-11 21:29:13.036649+00	168	/media/product/Abbot_diabetic_care_3.png	1	[{"added": {}}]	31	2
323	2021-05-11 21:29:22.999221+00	169	/media/product/Abbot_diabetic_care_4.png	1	[{"added": {}}]	31	2
324	2021-05-11 21:29:32.864077+00	170	/media/product/Abbot_diabetic_care_5.png	1	[{"added": {}}]	31	2
325	2021-05-11 21:29:51.974921+00	171	/media/product/Abbot_diabetic_care_6.png	1	[{"added": {}}]	31	2
326	2021-05-11 21:30:03.836337+00	172	/media/product/Abbot_diabetic_care_7.png	1	[{"added": {}}]	31	2
327	2021-05-12 05:20:30.957319+00	39	Quista DN (Himalaya)	1	[{"added": {}}]	22	2
328	2021-05-12 05:20:53.674331+00	173	/media/product/Himalaya_quista_dn_1.png	1	[{"added": {}}]	31	2
329	2021-05-12 05:21:07.540766+00	174	/media/product/Himalaya_quista_dn_2.png	1	[{"added": {}}]	31	2
330	2021-05-12 05:23:42.893918+00	175	/media/product/Himalaya_quista_dn_3.png	1	[{"added": {}}]	31	2
331	2021-05-12 05:24:02.82227+00	176	/media/product/Himalaya_quista_dn_4.png	1	[{"added": {}}]	31	2
332	2021-05-12 06:30:29.921893+00	40	Axe Signature Intense Strong Woody No Gas Body Deodorant For Men(154ml)	1	[{"added": {}}]	22	2
333	2021-05-12 06:30:54.292017+00	177	/media/product/Axe_signature_1.png	1	[{"added": {}}]	31	2
334	2021-05-12 06:31:05.684698+00	178	/media/product/Axe_signature_2.png	1	[{"added": {}}]	31	2
335	2021-05-12 06:31:18.488754+00	179	/media/product/Axe_signature_4.png	1	[{"added": {}}]	31	2
336	2021-05-12 06:31:30.375836+00	180	/media/product/Axe_signature_3.png	1	[{"added": {}}]	31	2
337	2021-05-12 06:31:40.876626+00	181	/media/product/Axe_signature_5.png	1	[{"added": {}}]	31	2
338	2021-05-12 06:31:51.577369+00	182	/media/product/Axe_signature_6.png	1	[{"added": {}}]	31	2
339	2021-05-12 06:32:00.638194+00	183	/media/product/Axe_signature_7.png	1	[{"added": {}}]	31	2
340	2021-05-12 06:33:19.189062+00	5	Perfumes	1	[{"added": {}}]	24	2
341	2021-05-12 07:00:08.828138+00	41	Fogg Body Spray Bleu Skies - 120ml	1	[{"added": {}}]	22	2
342	2021-05-12 07:00:40.099857+00	184	/media/product/Fogg_blue_ocean_1.png	1	[{"added": {}}]	31	2
343	2021-05-12 07:00:50.03226+00	185	/media/product/Fogg_blue_ocean_2.png	1	[{"added": {}}]	31	2
344	2021-05-12 07:01:00.886964+00	186	/media/product/Fogg_blue_ocean_3.png	1	[{"added": {}}]	31	2
345	2021-05-12 07:01:12.077695+00	187	/media/product/Fogg_blue_ocean_4.png	1	[{"added": {}}]	31	2
346	2021-05-12 07:01:21.649978+00	188	/media/product/Fogg_blue_ocean_5.png	1	[{"added": {}}]	31	2
347	2021-05-12 07:01:31.894385+00	189	/media/product/Fogg_blue_ocean_6.png	1	[{"added": {}}]	31	2
348	2021-05-12 07:02:20.065613+00	186	/media/product/Fogg_blue_ocean_3.png	3		31	2
349	2021-05-12 07:37:04.077315+00	42	abur Chyawanprash 2X Immunity	1	[{"added": {}}]	22	2
350	2021-05-12 07:37:29.115227+00	190	/media/product/Dabur_chawanprass_1.png	1	[{"added": {}}]	31	2
351	2021-05-12 07:37:38.377348+00	191	/media/product/Dabur_chawanprass_2.png	1	[{"added": {}}]	31	2
352	2021-05-12 07:37:48.41706+00	192	/media/product/Dabur_chawanprass_3.png	1	[{"added": {}}]	31	2
353	2021-05-12 07:37:58.330921+00	193	/media/product/Dabur_chawanprass_4.png	1	[{"added": {}}]	31	2
354	2021-05-12 07:38:07.256458+00	194	/media/product/Dabur_chawanprass_5.png	1	[{"added": {}}]	31	2
355	2021-05-12 07:40:37.024572+00	5	Immunity Booster	1	[{"added": {}}]	21	2
356	2021-05-12 07:40:44.643937+00	10	Immunity Booster	1	[{"added": {}}]	30	2
357	2021-05-12 07:41:17.194237+00	42	Dabur Chyawanprash 2X Immunity	2	[{"changed": {"fields": ["Name"]}}]	22	2
358	2021-05-12 07:47:12.683327+00	43	Dabur Chyawanprakash Sugarfree	1	[{"added": {}}]	22	2
359	2021-05-12 07:47:35.728773+00	195	/media/product/Dabur_chawanprass_sugar_free_1.png	1	[{"added": {}}]	31	2
360	2021-05-12 07:47:45.94675+00	196	/media/product/Dabur_chawanprass_sugar_free_2.png	1	[{"added": {}}]	31	2
361	2021-05-12 07:47:55.494049+00	197	/media/product/Dabur_chawanprass_sugar_free_3.png	1	[{"added": {}}]	31	2
362	2021-05-12 07:48:04.194877+00	198	/media/product/Dabur_chawanprass_sugar_free_4.png	1	[{"added": {}}]	31	2
363	2021-05-12 07:48:13.385925+00	199	/media/product/Dabur_chawanprass_5_teAbkGT.png	1	[{"added": {}}]	31	2
364	2021-05-12 07:48:51.116613+00	11	Immunity Booster	1	[{"added": {}}]	30	2
365	2021-05-12 09:17:29.348318+00	44	Engage W4 Perfume Spray - For Women, 120 ml	1	[{"added": {}}]	22	2
366	2021-05-12 09:23:03.13252+00	200	/media/product/Engage_perfume_women_3.png	1	[{"added": {}}]	31	2
367	2021-05-12 09:23:36.358127+00	201	/media/product/Engage_perfume_women_1.png	1	[{"added": {}}]	31	2
368	2021-05-12 09:23:51.204815+00	202	/media/product/Engage_perfume_women_4.png	1	[{"added": {}}]	31	2
369	2021-05-12 09:24:04.045246+00	203	/media/product/Engage_perfume_women_6.png	1	[{"added": {}}]	31	2
370	2021-05-12 09:24:15.78746+00	204	/media/product/Engage_perfume_women_5.png	1	[{"added": {}}]	31	2
371	2021-05-12 09:24:29.244379+00	205	/media/product/Untitled-3.png	1	[{"added": {}}]	31	2
372	2021-05-12 09:25:46.027268+00	42	Dabur Chyawanprash 2X Immunity	2	[{"changed": {"fields": ["Category"]}}]	22	2
373	2021-05-12 09:40:07.426291+00	5	Upto 20% on immunity booster products	2	[{"changed": {"fields": ["Name"]}}]	21	2
374	2021-05-12 09:40:11.473195+00	11	Upto 20% on immunity booster products	2	[]	30	2
376	2021-05-12 09:47:41.624998+00	12	Diabetic care supplements	1	[{"added": {}}]	30	2
377	2021-05-12 09:47:50.546874+00	13	Diabetic care supplements	1	[{"added": {}}]	30	2
378	2021-05-12 09:47:59.86572+00	14	Diabetic care supplements	1	[{"added": {}}]	30	2
379	2021-05-12 16:37:02.382827+00	10	Toothpastes & Tooth brushes	1	[{"added": {}}]	18	2
380	2021-05-12 16:43:42.414585+00	45	Colgate Toothpaste Dental Paste for oral hygiene	1	[{"added": {}}]	22	2
381	2021-05-12 16:44:02.9687+00	206	/media/product/colgate_strong_teeth_1.png	1	[{"added": {}}]	31	2
382	2021-05-12 16:44:15.813296+00	207	/media/product/colgate_strong_teeth_2.png	1	[{"added": {}}]	31	2
383	2021-05-12 16:44:24.764696+00	208	/media/product/colgate_strong_teeth_3.png	1	[{"added": {}}]	31	2
384	2021-05-12 16:44:34.820789+00	209	/media/product/colgate_strong_teeth_5.png	1	[{"added": {}}]	31	2
385	2021-05-12 16:48:05.985924+00	210	/media/product/colgate_strong_teeth_4.png	1	[{"added": {}}]	31	2
386	2021-05-12 17:10:33.657973+00	46	Sensodyne Sensitive Toothpaste - 40g (Sensodyne_	1	[{"added": {}}]	22	2
387	2021-05-12 17:10:59.873518+00	211	/media/product/sensodyne_fresh_mint_40gm_1.png	1	[{"added": {}}]	31	2
388	2021-05-12 17:11:15.521053+00	212	/media/product/sensodyne_fresh_mint_40gm_2.png	1	[{"added": {}}]	31	2
389	2021-05-12 17:34:16.694677+00	213	/media/product/sensodyne_fresh_mint_glosmith_logo1.png	1	[{"added": {}}]	31	2
390	2021-05-12 17:34:34.871159+00	46	Sensodyne Sensitive Toothpaste - 40g (Sensodyne)	2	[{"changed": {"fields": ["Name"]}}]	22	2
391	2021-05-12 17:38:01.000822+00	47	Sensodyne Sensitive Toothpaste - 150g  (Sensodyne)	1	[{"added": {}}]	22	2
392	2021-05-12 17:38:57.279525+00	214	/media/product/sensodyne_fresh_mint_3.png	1	[{"added": {}}]	31	2
393	2021-05-12 17:39:08.138361+00	215	/media/product/sensodyne_fresh_mint_4.png	1	[{"added": {}}]	31	2
394	2021-05-12 17:39:19.2181+00	216	/media/product/sensodyne_fresh_mint_150gm_1.png	1	[{"added": {}}]	31	2
395	2021-05-12 17:39:30.416972+00	217	/media/product/sensodyne_fresh_mint_150gm_2.png	1	[{"added": {}}]	31	2
396	2021-05-12 17:39:42.243098+00	218	/media/product/sensodyne_fresh_mint_150gm_3.png	1	[{"added": {}}]	31	2
397	2021-05-12 17:40:01.346089+00	219	/media/product/sensodyne_fresh_mint_glosmith_logo1_uoj6iIg.png	1	[{"added": {}}]	31	2
398	2021-05-12 17:50:49.770536+00	48	Dabur Babool Ayurvedic Toothpaste 100gm (Dabur)	1	[{"added": {}}]	22	2
399	2021-05-12 17:51:14.23964+00	220	/media/product/Dabur_babbol_1.png	1	[{"added": {}}]	31	2
400	2021-05-12 17:51:28.424033+00	221	/media/product/Dabur_babbol_2.png	1	[{"added": {}}]	31	2
401	2021-05-12 17:51:38.350194+00	222	/media/product/Dabur_babbol_3.png	1	[{"added": {}}]	31	2
402	2021-05-12 17:51:47.694757+00	223	/media/product/Dabur_comman_1.png	1	[{"added": {}}]	31	2
403	2021-05-12 18:00:19.188891+00	49	Dentosys Herbal Toothpaste Oral Hygiene (Dr. Morepen)	1	[{"added": {}}]	22	2
404	2021-05-12 18:00:36.736661+00	224	/media/product/Dentoys_herbal_toothpaste.png	1	[{"added": {}}]	31	2
405	2021-05-12 18:00:46.981872+00	225	/media/product/Dentoys_herbal_toothpaste_2.png	1	[{"added": {}}]	31	2
406	2021-05-12 18:00:58.614199+00	226	/media/product/Dr_morepen_logo_comman.png	1	[{"added": {}}]	31	2
407	2021-05-12 18:14:01.288384+00	50	Dabur Meswak Toothpaste (100gm)	1	[{"added": {}}]	22	2
408	2021-05-12 18:14:17.54311+00	227	/media/product/Dabur_meshwak_1.png	1	[{"added": {}}]	31	2
409	2021-05-12 18:14:32.658355+00	228	/media/product/Dabur_meshwak_3.png	1	[{"added": {}}]	31	2
410	2021-05-12 18:14:44.329031+00	229	/media/product/Dabur_meshwak_2.png	1	[{"added": {}}]	31	2
411	2021-05-12 18:14:55.926461+00	230	/media/product/Dabur_meshwak_5.png	1	[{"added": {}}]	31	2
412	2021-05-12 18:15:06.902189+00	231	/media/product/Dabur_meshwak_4.png	1	[{"added": {}}]	31	2
413	2021-05-12 18:18:14.598689+00	232	/media/product/Dabur_logo_comman.png	1	[{"added": {}}]	31	2
414	2021-05-12 18:31:01.903645+00	51	Emoform Oral Hygiene  Toothpaste (100gm)	1	[{"added": {}}]	22	2
415	2021-05-12 18:31:20.329036+00	233	/media/product/Emoform_1.png	1	[{"added": {}}]	31	2
416	2021-05-12 18:31:32.322989+00	234	/media/product/Emoform_2.png	1	[{"added": {}}]	31	2
417	2021-05-12 18:31:44.557558+00	235	/media/product/Emoform_4.png	1	[{"added": {}}]	31	2
418	2021-05-12 18:33:16.467369+00	236	/media/product/Emoform_5.png	1	[{"added": {}}]	31	2
419	2021-05-13 05:13:21.125397+00	52	Pepsodent Germi Check 100gm Oral Hygiene Toothpaste(100 gm)	1	[{"added": {}}]	22	2
420	2021-05-13 05:13:58.060278+00	237	/media/product/pepsodent_germi_1.png	1	[{"added": {}}]	31	2
421	2021-05-13 05:14:14.753053+00	238	/media/product/pepsodent_germi_3.png	1	[{"added": {}}]	31	2
422	2021-05-13 05:14:26.995068+00	239	/media/product/pepsodent_germi_4.png	1	[{"added": {}}]	31	2
423	2021-05-13 05:14:38.840348+00	240	/media/product/pepsodent_germi_5.png	1	[{"added": {}}]	31	2
424	2021-05-13 05:14:53.444762+00	241	/media/product/pepsodent_germi_6.png	1	[{"added": {}}]	31	2
425	2021-05-13 05:15:06.607852+00	242	/media/product/pepsodent_germi_2.png	1	[{"added": {}}]	31	2
426	2021-05-13 05:15:17.801836+00	243	/media/product/pepsodent_germi_1_comman.png	1	[{"added": {}}]	31	2
427	2021-05-13 05:35:23.668278+00	53	Colgate Max Fresh Toothpaste for Fresh Breath(100gm)	1	[{"added": {}}]	22	2
428	2021-05-13 05:35:43.230996+00	244	/media/product/colgate_maxfresh_100gm_1.png	1	[{"added": {}}]	31	2
429	2021-05-13 05:35:56.047844+00	245	/media/product/colgate_maxfresh_100gm_2.png	1	[{"added": {}}]	31	2
430	2021-05-13 05:36:10.288065+00	246	/media/product/colgate_maxfresh_100gm_3.png	1	[{"added": {}}]	31	2
431	2021-05-13 05:36:24.306705+00	247	/media/product/colgate_maxfresh_100gm_5.png	1	[{"added": {}}]	31	2
432	2021-05-13 05:36:34.216801+00	248	/media/product/colgate_maxfresh_100gm_6.png	1	[{"added": {}}]	31	2
433	2021-05-13 05:54:03.359851+00	54	Himalaya Sparkling White Herbal Toothpaste 80 gm	1	[{"added": {}}]	22	2
434	2021-05-13 05:54:30.240279+00	249	/media/product/himalaya_sprakling_white_80gm_1.png	1	[{"added": {}}]	31	2
435	2021-05-13 05:54:45.370901+00	250	/media/product/himalaya_sprakling_white_80gm_2.png	1	[{"added": {}}]	31	2
436	2021-05-13 05:54:59.275128+00	251	/media/product/himalaya_sprakling_white_3.png	1	[{"added": {}}]	31	2
437	2021-05-13 05:55:11.170965+00	252	/media/product/himalaya_sprakling_white_2.png	1	[{"added": {}}]	31	2
438	2021-05-13 05:55:23.801603+00	253	/media/product/himalaya_sprakling_white_comman_all.png	1	[{"added": {}}]	31	2
439	2021-05-13 05:58:32.930026+00	54	Himalaya Sparkling White Herbal Toothpaste 80 gm	2	[{"changed": {"fields": ["Actual price", "Price"]}}]	22	2
440	2021-05-13 05:59:48.451093+00	55	HImalaya Sparkling  White Herbal Toothpaste 100 Gm	1	[{"added": {}}]	22	2
441	2021-05-13 06:00:08.876971+00	254	/media/product/himalaya_sprakling_white_2_Z2bkrTB.png	1	[{"added": {}}]	31	2
442	2021-05-13 06:00:22.034095+00	255	/media/product/himalaya_sprakling_white_3_6u8RNIy.png	1	[{"added": {}}]	31	2
443	2021-05-13 06:00:45.41532+00	256	/media/product/himalaya_sprakling_white_4.png	1	[{"added": {}}]	31	2
444	2021-05-13 06:00:59.753956+00	257	/media/product/himalaya_sprakling_white_comman_all_VY1P6tg.png	1	[{"added": {}}]	31	2
445	2021-05-13 06:01:48.197919+00	254	/media/product/himalaya_sprakling_white_2_Z2bkrTB.png	3		31	2
446	2021-05-13 07:04:05.692961+00	56	Patanjali Dant Kanti Ayurvedic Toothpaste (100 gm)	1	[{"added": {}}]	22	2
447	2021-05-13 07:04:25.96263+00	258	/media/product/patanjali_dant_kanti_1.png	1	[{"added": {}}]	31	2
448	2021-05-13 07:04:41.249268+00	259	/media/product/patanjali_dant_kanti_2.png	1	[{"added": {}}]	31	2
449	2021-05-13 07:04:52.223988+00	260	/media/product/patanjali_dant_kanti_4.png	1	[{"added": {}}]	31	2
450	2021-05-13 07:05:07.688092+00	261	/media/product/patanjali_dant_kanti_3.png	1	[{"added": {}}]	31	2
451	2021-05-13 07:16:40.966817+00	57	XTAR  Toothpaste	1	[{"added": {}}]	22	2
452	2021-05-13 07:17:12.217624+00	262	/media/product/X_TAR_1.png	1	[{"added": {}}]	31	2
453	2021-05-13 07:17:23.190292+00	263	/media/product/X_TAR_2.png	1	[{"added": {}}]	31	2
454	2021-05-13 07:17:35.106074+00	264	/media/product/X_TAR_3.png	1	[{"added": {}}]	31	2
455	2021-05-13 07:17:52.36928+00	265	/media/product/X_TAR_4.png	1	[{"added": {}}]	31	2
456	2021-05-13 07:18:02.696768+00	266	/media/product/X_TAR_5.png	1	[{"added": {}}]	31	2
457	2021-05-13 07:39:00.298494+00	58	Colgate Total Multi Benefit Toothpaste (120 gm)	1	[{"added": {}}]	22	2
458	2021-05-13 07:39:22.122517+00	267	/media/product/colgate_total_2.png	1	[{"added": {}}]	31	2
459	2021-05-13 07:39:33.581615+00	268	/media/product/colgate_total_1.png	1	[{"added": {}}]	31	2
460	2021-05-13 07:40:35.886827+00	269	/media/product/colgate_total_4.png	1	[{"added": {}}]	31	2
461	2021-05-13 07:41:31.840745+00	270	/media/product/colgate_total_3.png	1	[{"added": {}}]	31	2
462	2021-05-13 11:22:56.103043+00	59	Closeup Fresh Breath Toothpaste 80 gm	1	[{"added": {}}]	22	2
463	2021-05-13 11:23:12.512822+00	271	/media/product/close_up_1.png	1	[{"added": {}}]	31	2
464	2021-05-13 11:23:26.973662+00	272	/media/product/close_up_4.png	1	[{"added": {}}]	31	2
465	2021-05-13 11:23:40.852305+00	273	/media/product/close_up_7.png	1	[{"added": {}}]	31	2
466	2021-05-13 11:25:59.93009+00	274	/media/product/close_up_fresh_breath.png	1	[{"added": {}}]	31	2
467	2021-05-13 11:26:30.128291+00	272	/media/product/close_up_4.png	3		31	2
468	2021-05-13 11:28:18.584294+00	275	/media/product/close_up_fresh_breath_80gm.png	1	[{"added": {}}]	31	2
469	2021-05-13 11:31:31.779627+00	60	Closeup Fresh Breath Toothpaste 150 gm	1	[{"added": {}}]	22	2
470	2021-05-13 11:31:57.323693+00	276	/media/product/close_up_1_2vZigCK.png	1	[{"added": {}}]	31	2
471	2021-05-13 11:32:14.350178+00	277	/media/product/close_up_5.png	1	[{"added": {}}]	31	2
472	2021-05-13 11:32:27.730138+00	278	/media/product/close_up_fresh_breath_fDGmBSO.png	1	[{"added": {}}]	31	2
473	2021-05-13 11:36:37.748911+00	279	/media/product/close_up_fresh_breath_150gm.png	1	[{"added": {}}]	31	2
474	2021-05-13 11:40:38.604794+00	55	Himalaya Sparkling  White Herbal Toothpaste 100 Gm	2	[{"changed": {"fields": ["Name"]}}]	22	2
475	2021-05-13 12:26:05.941657+00	11	Creams and Face washes	1	[{"added": {}}]	18	2
476	2021-05-13 12:28:18.91598+00	61	Glow & Lovely (Fair &Lovely) 25gm	1	[{"added": {}}]	22	2
477	2021-05-13 12:28:44.321107+00	280	/media/product/Fair_lovely_1.png	1	[{"added": {}}]	31	2
478	2021-05-13 12:28:53.630421+00	281	/media/product/Fair_lovely_2.png	1	[{"added": {}}]	31	2
479	2021-05-13 12:29:04.034508+00	282	/media/product/Fair_lovely_3.png	1	[{"added": {}}]	31	2
480	2021-05-13 12:29:15.354197+00	283	/media/product/Fair_lovely_4.png	1	[{"added": {}}]	31	2
481	2021-05-13 12:29:26.222231+00	284	/media/product/Fair_lovely_5.png	1	[{"added": {}}]	31	2
482	2021-05-13 15:38:46.382919+00	62	Glow & Lovely (Fair &Lovely)  100 gm	1	[{"added": {}}]	22	2
483	2021-05-13 15:39:06.105086+00	285	/media/product/Fair_lovely_100gm.png	1	[{"added": {}}]	31	2
484	2021-05-13 15:39:15.749631+00	286	/media/product/Fair_lovely_2_bSBh7On.png	1	[{"added": {}}]	31	2
485	2021-05-13 15:39:24.477173+00	287	/media/product/Fair_lovely_4_KJBRUVv.png	1	[{"added": {}}]	31	2
486	2021-05-13 15:39:33.117556+00	288	/media/product/Fair_lovely_5_tuvIGQ8.png	1	[{"added": {}}]	31	2
487	2021-05-13 15:49:08.659949+00	63	Fair & Lovely Ayurvedic Care Face Cream 25gm	1	[{"added": {}}]	22	2
488	2021-05-13 15:49:27.077125+00	289	/media/product/Fair_lovely_ayurvedic_1.png	1	[{"added": {}}]	31	2
489	2021-05-13 15:49:36.872529+00	290	/media/product/Fair_lovely_ayurvedic_2.png	1	[{"added": {}}]	31	2
490	2021-05-13 15:49:47.905328+00	291	/media/product/Fair_lovely_ayurvedic_3.png	1	[{"added": {}}]	31	2
491	2021-05-13 15:49:56.385244+00	292	/media/product/Fair_lovely_ayurvedic_4.png	1	[{"added": {}}]	31	2
492	2021-05-13 15:50:06.083493+00	293	/media/product/Fair_lovely_ayurvedic_5.png	1	[{"added": {}}]	31	2
493	2021-05-13 15:50:15.500481+00	294	/media/product/Fair_lovely_3_iPi990h.png	1	[{"added": {}}]	31	2
494	2021-05-13 16:46:23.922511+00	64	Fair and Handsome cream for men 30gm	1	[{"added": {}}]	22	2
495	2021-05-13 16:46:43.528082+00	295	/media/product/Fair_handsome_1.png	1	[{"added": {}}]	31	2
496	2021-05-13 16:47:02.486659+00	296	/media/product/Fair_handsome_2.png	1	[{"added": {}}]	31	2
497	2021-05-13 16:47:13.517255+00	297	/media/product/Fair_handsome_3.png	1	[{"added": {}}]	31	2
498	2021-05-13 16:47:24.453301+00	61	Glow & Lovely (Fair &Lovely) 25gm	2	[]	22	2
499	2021-05-13 16:48:50.815555+00	65	Fair and Handsome cream for men 60 gm	1	[{"added": {}}]	22	2
500	2021-05-13 16:49:07.60361+00	298	/media/product/Fair_handsome_4.png	1	[{"added": {}}]	31	2
501	2021-05-13 16:49:16.561846+00	299	/media/product/Fair_handsome_2_NrzrF6J.png	1	[{"added": {}}]	31	2
502	2021-05-13 16:49:26.340028+00	300	/media/product/Fair_handsome_1_KeUOv9M.png	1	[{"added": {}}]	31	2
503	2021-05-13 16:49:39.682397+00	301	/media/product/Fair_handsome_5.png	1	[{"added": {}}]	31	2
504	2021-05-13 16:49:57.797193+00	302	/media/product/Fair_handsome_5_vI6YcLJ.png	1	[{"added": {}}]	31	2
505	2021-05-13 16:50:03.931936+00	64	Fair and Handsome cream for men 30gm	2	[]	22	2
506	2021-05-13 17:09:54.48112+00	66	Fair & Lovely BB  Face Cream 9 gm	1	[{"added": {}}]	22	2
507	2021-05-13 17:11:42.846987+00	67	Fair & Lovely BB  Face Cream 18 gm	1	[{"added": {}}]	22	2
508	2021-05-13 17:13:55.598079+00	68	Fair & Lovely BB  Face Cream 40 gm	1	[{"added": {}}]	22	2
509	2021-05-13 17:14:44.51251+00	303	/media/product/fair_and_lovely_bb_cream_1.png	1	[{"added": {}}]	31	2
510	2021-05-13 17:14:55.515281+00	304	/media/product/fair_and_lovely_bb_cream_2.png	1	[{"added": {}}]	31	2
511	2021-05-13 17:15:08.015273+00	305	/media/product/fair_and_lovely_bb_cream_9.png	1	[{"added": {}}]	31	2
512	2021-05-13 17:15:44.237307+00	306	/media/product/fair_and_lovely_bb_cream_8.png	1	[{"added": {}}]	31	2
513	2021-05-13 17:15:54.709906+00	307	/media/product/fair_and_lovely_bb_cream_7.png	1	[{"added": {}}]	31	2
514	2021-05-13 17:16:29.772891+00	308	/media/product/fair_and_lovely_bb_cream_8_LSoiKrs.png	1	[{"added": {}}]	31	2
515	2021-05-13 17:21:06.913475+00	309	/media/product/fair_and_lovely_bb_cream_5.png	1	[{"added": {}}]	31	2
516	2021-05-13 17:21:19.246841+00	310	/media/product/fair_and_lovely_bb_cream_7_GKiJKag.png	1	[{"added": {}}]	31	2
517	2021-05-13 17:21:33.98558+00	311	/media/product/fair_and_lovely_bb_cream_10.png	1	[{"added": {}}]	31	2
518	2021-05-13 17:21:47.676581+00	312	/media/product/Fair_lovely_3_fXD16xf.png	1	[{"added": {}}]	31	2
519	2021-05-13 17:22:17.574071+00	313	/media/product/fair_and_lovely_bb_cream_2_JlsQinr.png	1	[{"added": {}}]	31	2
520	2021-05-13 17:22:28.83242+00	314	/media/product/fair_and_lovely_bb_cream_6.png	1	[{"added": {}}]	31	2
521	2021-05-13 17:22:49.382708+00	315	/media/product/fair_and_lovely_bb_cream_7_MYjB4mX.png	1	[{"added": {}}]	31	2
522	2021-05-13 17:24:10.477759+00	316	/media/product/fair_and_lovely_bb_cream_1_3QD7PZ4.png	1	[{"added": {}}]	31	2
523	2021-05-13 17:24:21.538533+00	317	/media/product/fair_and_lovely_bb_cream_10_c0Rj2Yf.png	1	[{"added": {}}]	31	2
524	2021-05-13 17:42:16.173+00	14	Nivea Men Intensive Moisturising Cream 50 ml	2	[{"changed": {"fields": ["Category"]}}]	22	2
525	2021-05-13 17:42:29.627008+00	10	olay	2	[{"changed": {"fields": ["Category"]}}]	22	2
526	2021-05-13 17:42:38.925881+00	11	L'Oreal Paris Skin Perfect	2	[{"changed": {"fields": ["Category"]}}]	22	2
527	2021-05-13 17:42:50.120492+00	12	Lakme youth infinity	2	[{"changed": {"fields": ["Category"]}}]	22	2
528	2021-05-13 17:43:02.571097+00	13	Himalaya Face Cream	2	[{"changed": {"fields": ["Category"]}}]	22	2
529	2021-05-13 17:43:15.682686+00	15	Himalaya Men Natural Bright Face Cream – SPF 15	2	[{"changed": {"fields": ["Category"]}}]	22	2
530	2021-05-13 18:27:40.290066+00	69	Lakme Complexion Care Face Cream, 9gm	1	[{"added": {}}]	22	2
531	2021-05-13 18:28:02.920914+00	318	/media/product/Lakhme_9to5_1.png	1	[{"added": {}}]	31	2
532	2021-05-13 18:28:12.579445+00	319	/media/product/Lakhme_9to5_Beige_1.png	1	[{"added": {}}]	31	2
533	2021-05-13 18:28:28.597249+00	320	/media/product/Lakhme_9to5_3.png	1	[{"added": {}}]	31	2
534	2021-05-13 18:28:42.936718+00	321	/media/product/Lakhme_9to5_6.png	1	[{"added": {}}]	31	2
535	2021-05-13 18:28:56.137632+00	322	/media/product/Lakhme_9to5_5.png	1	[{"added": {}}]	31	2
536	2021-05-13 18:31:40.86182+00	70	Lakme Complexion Care Face Cream, 30 gm	1	[{"added": {}}]	22	2
537	2021-05-13 18:31:59.146593+00	323	/media/product/Lakhme_9to5_honey_1.png	1	[{"added": {}}]	31	2
538	2021-05-13 18:32:17.037199+00	324	/media/product/Lakhme_9to5_5_MRIq1LQ.png	1	[{"added": {}}]	31	2
539	2021-05-13 18:32:34.604585+00	325	/media/product/Lakhme_9to5_6_nhrJro0.png	1	[{"added": {}}]	31	2
540	2021-05-13 18:32:46.252356+00	326	/media/product/Lakhme_9to5_3_iH4ETRi.png	1	[{"added": {}}]	31	2
541	2021-05-13 18:54:34.787843+00	5	Shivik3164@gmail.com	3		4	1
542	2021-05-14 03:54:45.002896+00	327	/media/product/ponds_bb_cream_1.png	1	[{"added": {}}]	31	2
543	2021-05-14 03:55:02.483584+00	328	/media/product/ponds_bb_cream_2.png	1	[{"added": {}}]	31	2
544	2021-05-14 03:56:56.3871+00	329	/media/product/ponds_bb_cream_3.png	1	[{"added": {}}]	31	2
545	2021-05-14 03:57:07.208121+00	330	/media/product/ponds_bb_cream_4.png	1	[{"added": {}}]	31	2
546	2021-05-14 03:57:17.852511+00	331	/media/product/ponds_bb_cream_6.png	1	[{"added": {}}]	31	2
547	2021-05-14 03:57:56.451908+00	71	Pond's BB+ Cream 9Gm	2	[{"changed": {"fields": ["Name", "Actual price", "Price"]}}]	22	2
548	2021-05-14 03:58:28.519322+00	71	Pond's BB+ Cream 9Gm	2	[{"changed": {"fields": ["Keyword"]}}]	22	2
549	2021-05-14 04:14:10.509329+00	72	Garnier Men Acno Fight, Anti-Pimple Face Cream	2	[{"changed": {"fields": ["Name", "Actual price", "Price", "Keyword"]}}]	22	2
550	2021-05-14 04:14:32.830121+00	332	/media/product/Garnier_men_acno_fight_.png	1	[{"added": {}}]	31	2
551	2021-05-14 04:14:44.558409+00	333	/media/product/Garnier_men_acno_fight_2.png	1	[{"added": {}}]	31	2
552	2021-05-14 04:15:47.54052+00	334	/media/product/Garnier_men_acno_fight_3.png	1	[{"added": {}}]	31	2
553	2021-05-14 04:15:59.196138+00	335	/media/product/Garnier_men_acno_fight_4.png	1	[{"added": {}}]	31	2
554	2021-05-14 04:16:10.535432+00	336	/media/product/Garnier_men_acno_fight_5.png	1	[{"added": {}}]	31	2
555	2021-05-14 04:16:49.090908+00	72	Garnier Men Acno Fight, Anti-Pimple Face Cream 45 gm	2	[{"changed": {"fields": ["Name"]}}]	22	2
556	2021-05-14 04:21:17.523916+00	13	Himalaya Natural Glow Face Cream 25gm	2	[{"changed": {"fields": ["Name", "Actual price"]}}]	22	2
557	2021-05-15 05:30:08.011899+00	5	Perfumes	2	[]	24	2
558	2021-05-15 05:30:37.258419+00	6	Perfumes MEN & WOMEN	1	[{"added": {}}]	24	2
559	2021-05-15 05:39:20.256083+00	6	Perfumes MEN & WOMEN	2	[{"changed": {"fields": ["Image"]}}]	24	2
560	2021-05-15 05:40:36.554283+00	6	Perfumes MEN & WOMEN	2	[{"changed": {"fields": ["Button name"]}}]	24	2
561	2021-05-15 05:40:45.488329+00	6	Perfumes MEN & WOMEN	2	[{"changed": {"fields": ["Button name"]}}]	24	2
562	2021-05-15 08:14:01.352348+00	5	Perfumes	3		24	2
563	2021-05-15 08:22:47.147686+00	4	suppliments	2	[{"changed": {"fields": ["Description", "Image"]}}]	24	2
564	2021-05-15 08:27:51.266469+00	3	Cold and cough	2	[{"changed": {"fields": ["Name", "Description", "Button name", "Image", "Url name"]}}]	24	2
565	2021-05-15 11:29:09.031573+00	3	Welcome to Gromdy.com! India’s first fast delivery platform for medicine and grocery!	1	[{"added": {}}]	23	2
566	2021-05-15 11:58:39.648346+00	6	shivik3164@gmail.com	3		4	1
567	2021-05-15 12:19:16.383498+00	2	Who we are – Gromdy is India’s first fastest delivering pharmacy and grocery products!	1	[{"added": {}}]	16	2
568	2021-05-15 12:23:35.26818+00	2	Who we are – Gromdy is India’s first fastest delivering pharmacy and grocery products!	2	[{"changed": {"fields": ["Image"]}}]	16	2
569	2021-05-15 12:25:06.413307+00	3	What we do – we offer grocery and medicines to you in short period of time possible	1	[{"added": {}}]	16	2
570	2021-05-15 12:25:58.834552+00	4	One Point solution for all of your demand	1	[{"added": {}}]	16	2
571	2021-05-15 12:47:13.617565+00	8	Grocery	1	[{"added": {}}]	20	2
572	2021-05-15 12:49:04.741517+00	12	Edible oil	1	[{"added": {}}]	18	2
573	2021-05-15 13:51:30.176131+00	12	Edible oil	2	[{"changed": {"fields": ["Description", "Keyword"]}}]	18	2
574	2021-05-15 14:55:06.313394+00	73	Fortune Mustard oil 1 L	1	[{"added": {}}]	22	2
575	2021-05-15 15:01:42.795439+00	337	/media/product/fortune_mustardoil_1L_1.png	1	[{"added": {}}]	31	2
576	2021-05-15 15:01:56.081514+00	338	/media/product/fortune_1_mustardoil_1L_12.png	1	[{"added": {}}]	31	2
577	2021-05-15 15:07:38.310318+00	74	Fortune Mustard oil 5 L	1	[{"added": {}}]	22	2
578	2021-05-15 15:08:17.702658+00	339	/media/product/fortune_1_mustardoil_5L_1.png	1	[{"added": {}}]	31	2
579	2021-05-15 15:08:25.812007+00	340	/media/product/fortune_1_mustardoil_5L_2.png	1	[{"added": {}}]	31	2
580	2021-05-15 15:08:34.262591+00	341	/media/product/fortune_1_mustardoil_5L_3.png	1	[{"added": {}}]	31	2
581	2021-05-15 15:11:37.626137+00	75	Fortune Soybean Oil 5L	1	[{"added": {}}]	22	2
582	2021-05-15 15:14:41.579723+00	342	/media/product/fortune_1_soybeanoil_5L_1.png	1	[{"added": {}}]	31	2
583	2021-05-15 15:14:51.285771+00	343	/media/product/fortune_1_soybeanoil_5L_2.png	1	[{"added": {}}]	31	2
584	2021-05-15 15:23:29.356952+00	76	Fortune Soybean Oil 1 L	1	[{"added": {}}]	22	2
585	2021-05-15 15:24:21.661109+00	344	/media/product/fortune_1_mustardoil_1L_1.png	1	[{"added": {}}]	31	2
586	2021-05-15 15:24:37.014053+00	345	/media/product/fortune_1_soybeanoil_1L_2.png	1	[{"added": {}}]	31	2
587	2021-05-15 15:24:45.881459+00	346	/media/product/fortune_1_soybeanoil_1L_3.png	1	[{"added": {}}]	31	2
588	2021-05-15 15:50:15.346177+00	13	Flours	1	[{"added": {}}]	18	2
589	2021-05-15 15:51:00.50665+00	77	Aashirwad atta 10kg	1	[{"added": {}}]	22	2
590	2021-05-15 15:51:19.271714+00	347	/media/product/AAshirvaad_atta_10kg_1.png	1	[{"added": {}}]	31	2
591	2021-05-15 15:51:28.858462+00	348	/media/product/AAshirvaad_atta_10kg_3.png	1	[{"added": {}}]	31	2
592	2021-05-15 15:51:39.920861+00	349	/media/product/AAshirvaad_atta_10kg_comman.png	1	[{"added": {}}]	31	2
593	2021-05-15 15:53:51.758985+00	78	Aashirwad atta 5 kg	1	[{"added": {}}]	22	2
594	2021-05-15 15:54:24.551916+00	350	/media/product/AAshirvaad_atta_10kg_2.png	1	[{"added": {}}]	31	2
595	2021-05-15 15:54:41.051966+00	351	/media/product/AAshirvaad_atta_10kg_1_IkA8RRs.png	1	[{"added": {}}]	31	2
596	2021-05-15 15:54:54.323191+00	352	/media/product/AAshirvaad_atta_10kg_comman_q5mpyqZ.png	1	[{"added": {}}]	31	2
597	2021-05-15 16:05:09.550046+00	79	Rajdhani Besan 1kg	1	[{"added": {}}]	22	2
598	2021-05-15 16:05:33.390829+00	353	/media/product/Rajdhani_besan_1.png	1	[{"added": {}}]	31	2
599	2021-05-15 16:05:45.436276+00	354	/media/product/Rajdhani_besan_2.png	1	[{"added": {}}]	31	2
600	2021-05-15 16:05:55.658158+00	355	/media/product/Rajdhani_besan_3.png	1	[{"added": {}}]	31	2
601	2021-05-15 16:06:05.984679+00	356	/media/product/Rajdhani_besan.png	1	[{"added": {}}]	31	2
602	2021-05-15 16:08:36.973817+00	80	Rajdhani Besan 500 gm	1	[{"added": {}}]	22	2
603	2021-05-15 16:09:07.411529+00	357	/media/product/Rajdhani_besan_2_eGIGAM0.png	1	[{"added": {}}]	31	2
604	2021-05-15 16:09:18.328982+00	358	/media/product/Rajdhani_besan_1_OdGbXD0.png	1	[{"added": {}}]	31	2
605	2021-05-15 16:16:02.818486+00	81	Rakesh Besan 1 kg	1	[{"added": {}}]	22	2
606	2021-05-15 16:16:21.566223+00	359	/media/product/Rakes_besan_1.png	1	[{"added": {}}]	31	2
607	2021-05-15 16:16:30.717688+00	360	/media/product/Rakes_besan_2.png	1	[{"added": {}}]	31	2
608	2021-05-15 16:17:05.403136+00	81	Rakesh Besan 500 gm	2	[{"changed": {"fields": ["Name", "Url slug", "Keyword"]}}]	22	2
609	2021-05-15 18:11:43.355799+00	14	Beverages	1	[{"added": {}}]	18	2
610	2021-05-15 18:20:39.703181+00	82	Tata Tea Premium 100gm	1	[{"added": {}}]	22	2
611	2021-05-15 18:20:58.909561+00	361	/media/product/tata_tea_premimum_100gm_1.png	1	[{"added": {}}]	31	2
612	2021-05-15 18:21:07.7369+00	362	/media/product/tata_tea_premimum_100gm_2.png	1	[{"added": {}}]	31	2
613	2021-05-15 18:21:16.266526+00	363	/media/product/tata_tea_premimum_100gm_3.png	1	[{"added": {}}]	31	2
614	2021-05-15 18:23:35.379907+00	83	Tata Tea Premium 250gm	1	[{"added": {}}]	22	2
615	2021-05-15 18:23:52.222798+00	364	/media/product/tata_tea_premimum_250gm_1.png	1	[{"added": {}}]	31	2
616	2021-05-15 18:23:59.566848+00	365	/media/product/tata_tea_premimum_100gm_3_EFoKWDG.png	1	[{"added": {}}]	31	2
617	2021-05-15 18:24:10.551264+00	366	/media/product/tata_tea_premimum_100gm_1_Egwe2t3.png	1	[{"added": {}}]	31	2
618	2021-05-15 18:28:02.214395+00	84	Tata Tea Premium 1kg	1	[{"added": {}}]	22	2
619	2021-05-15 18:28:19.353226+00	367	/media/product/tata_tea_premimum_1kg_1.png	1	[{"added": {}}]	31	2
620	2021-05-15 18:28:33.661424+00	368	/media/product/tata_tea_premimum_1kg_2.png	1	[{"added": {}}]	31	2
621	2021-05-15 18:28:42.536297+00	369	/media/product/tata_tea_premimum_1kg_3.png	1	[{"added": {}}]	31	2
622	2021-05-15 18:34:22.082584+00	85	Tata Tea Agni 250 gm	1	[{"added": {}}]	22	2
623	2021-05-15 18:34:39.925524+00	370	/media/product/tata_tea_agni_1.png	1	[{"added": {}}]	31	2
624	2021-05-15 18:34:47.944025+00	371	/media/product/tata_tea_agni_3.png	1	[{"added": {}}]	31	2
625	2021-05-15 18:34:56.765792+00	372	/media/product/tata_tea_agni_2.png	1	[{"added": {}}]	31	2
626	2021-05-15 18:39:48.044144+00	86	Brooke Bond Red Label Tea 250gm	1	[{"added": {}}]	22	2
627	2021-05-15 18:40:02.357822+00	373	/media/product/red_level_250gm_1.png	1	[{"added": {}}]	31	2
628	2021-05-15 18:40:12.624304+00	374	/media/product/red_level_250gm_2.png	1	[{"added": {}}]	31	2
629	2021-05-15 18:44:21.916378+00	87	Brooke Bond Taaza Tea, 250gm	1	[{"added": {}}]	22	2
630	2021-05-15 18:44:37.787682+00	375	/media/product/taza_1.png	1	[{"added": {}}]	31	2
631	2021-05-15 18:44:48.171139+00	376	/media/product/taza_2.png	1	[{"added": {}}]	31	2
632	2021-05-15 18:48:00.21762+00	88	Brooke Bond Taaza Tea, 100gm	1	[{"added": {}}]	22	2
633	2021-05-15 18:48:15.258744+00	377	/media/product/taza_100gm_1.png	1	[{"added": {}}]	31	2
634	2021-05-15 18:48:26.730874+00	378	/media/product/taza_1_6BuWf1M.png	1	[{"added": {}}]	31	2
635	2021-05-15 18:53:50.804536+00	89	Today Star Tea-200 gm	1	[{"added": {}}]	22	2
636	2021-05-15 18:54:06.681015+00	379	/media/product/today_star_1.png	1	[{"added": {}}]	31	2
637	2021-05-15 18:54:16.845862+00	380	/media/product/today_star_2.png	1	[{"added": {}}]	31	2
638	2021-05-15 19:01:13.461385+00	90	BRU Instant Coffee Powder ₹10 packet	1	[{"added": {}}]	22	2
639	2021-05-15 19:01:29.696854+00	381	/media/product/BRU_COFFEE_1.png	1	[{"added": {}}]	31	2
640	2021-05-15 19:01:37.181834+00	382	/media/product/BRU_COFFEE_2.png	1	[{"added": {}}]	31	2
641	2021-05-15 19:05:10.942071+00	91	Nescafe Classic Coffee ₹10 packet	1	[{"added": {}}]	22	2
642	2021-05-15 19:05:26.889571+00	383	/media/product/nescafe_1.png	1	[{"added": {}}]	31	2
643	2021-05-16 07:43:58.410707+00	15	Health Drink	1	[{"added": {}}]	18	2
644	2021-05-16 07:57:02.557153+00	92	Cadbury Bournvita Inner Strength 250 Gm	1	[{"added": {}}]	22	2
645	2021-05-16 07:57:26.68724+00	384	/media/product/bourn_vita_200gm_1.png	1	[{"added": {}}]	31	2
646	2021-05-16 07:57:26.834549+00	385	/media/product/bourn_vita_200gm_1_GHRdXUe.png	1	[{"added": {}}]	31	2
647	2021-05-16 07:57:37.083438+00	386	/media/product/bourn_vita_200gm_2.png	1	[{"added": {}}]	31	2
648	2021-05-16 07:57:54.066452+00	92	Cadbury Bournvita Inner Strength 200 Gm	2	[{"changed": {"fields": ["Name", "Url slug"]}}]	22	2
649	2021-05-16 08:04:52.532562+00	93	Cadbury Bournvita Inner Strength 500 Gm	1	[{"added": {}}]	22	2
650	2021-05-16 08:05:07.175509+00	387	/media/product/bourn_vita_500gm_1.png	1	[{"added": {}}]	31	2
651	2021-05-16 08:05:16.276201+00	388	/media/product/bourn_vita_200gm_2_UhZf62r.png	1	[{"added": {}}]	31	2
652	2021-05-16 08:05:24.962818+00	389	/media/product/bourn_vita_comman_1.png	1	[{"added": {}}]	31	2
653	2021-05-16 08:14:26.781813+00	94	Cadbury Bournvita Inner Strength 1Kg	1	[{"added": {}}]	22	2
654	2021-05-16 08:14:51.257209+00	390	/media/product/bourn_vita_1kg_1.png	1	[{"added": {}}]	31	2
655	2021-05-16 08:15:04.946204+00	391	/media/product/bourn_vita_200gm_2_WtmRhaU.png	1	[{"added": {}}]	31	2
656	2021-05-16 08:15:18.520685+00	392	/media/product/bourn_vita_1kg_2.png	1	[{"added": {}}]	31	2
657	2021-05-16 08:15:28.507593+00	393	/media/product/bourn_vita_comman_3.png	1	[{"added": {}}]	31	2
658	2021-05-16 08:24:39.986519+00	95	Cadbury Bournvita Inner Strength 75 Gm	1	[{"added": {}}]	22	2
659	2021-05-16 08:24:58.682446+00	394	/media/product/bourn_vita_packet_3.png	1	[{"added": {}}]	31	2
660	2021-05-16 08:25:10.787008+00	395	/media/product/bourn_vita_packet_1.png	1	[{"added": {}}]	31	2
661	2021-05-16 08:25:20.226826+00	396	/media/product/bourn_vita_packet_2.png	1	[{"added": {}}]	31	2
662	2021-05-16 08:25:28.631205+00	397	/media/product/bourn_vita_comman_1_v3lgDEg.png	1	[{"added": {}}]	31	2
663	2021-05-16 08:58:19.351231+00	96	Horlicks Health  Drink - Chocolate Flavour, 500 gm	1	[{"added": {}}]	22	2
664	2021-05-16 09:02:48.744697+00	398	/media/product/horlicks_choclate_flavour_500gm_1.png	1	[{"added": {}}]	31	2
665	2021-05-16 09:03:01.807215+00	399	/media/product/horlicks_choclate_flavour_500gm_3.png	1	[{"added": {}}]	31	2
666	2021-05-16 09:03:13.07636+00	400	/media/product/horlicks_comman_2.png	1	[{"added": {}}]	31	2
667	2021-05-16 09:03:28.112359+00	401	/media/product/horlicks_comman_1.png	1	[{"added": {}}]	31	2
668	2021-05-16 09:09:11.241275+00	97	Horlicks Health  Drink - Chocolate Flavour,  1Kg	1	[{"added": {}}]	22	2
669	2021-05-16 09:09:38.133021+00	402	/media/product/horlicks_1kg_1.png	1	[{"added": {}}]	31	2
670	2021-05-16 09:09:49.107584+00	403	/media/product/horlicks_1kg_2.png	1	[{"added": {}}]	31	2
671	2021-05-16 09:10:04.658199+00	404	/media/product/horlicks_1kg_3.png	1	[{"added": {}}]	31	2
672	2021-05-16 09:10:22.067202+00	405	/media/product/horlicks_comman_2_FSCeqyA.png	1	[{"added": {}}]	31	2
673	2021-05-16 09:36:53.381517+00	98	Glucon-D 500Gm	1	[{"added": {}}]	22	2
674	2021-05-16 09:37:52.079067+00	406	/media/product/glucon_D_500gm_1.png	1	[{"added": {}}]	31	2
675	2021-05-16 09:38:05.58267+00	407	/media/product/glucon_D_500gm_2.png	1	[{"added": {}}]	31	2
676	2021-05-16 09:38:15.601832+00	408	/media/product/glucon_D_500gm_3.png	1	[{"added": {}}]	31	2
677	2021-05-16 09:44:28.804891+00	99	Glucon Nimbu Pani 500Gm	1	[{"added": {}}]	22	2
678	2021-05-16 09:44:53.147475+00	409	/media/product/glucon_D_lime_1.png	1	[{"added": {}}]	31	2
679	2021-05-16 09:45:02.874745+00	410	/media/product/glucon_D_lime_2.png	1	[{"added": {}}]	31	2
680	2021-05-16 09:45:14.112599+00	411	/media/product/glucon_D_lime_3.png	1	[{"added": {}}]	31	2
681	2021-05-16 09:45:30.761811+00	412	/media/product/glucon_D_lime_4.png	1	[{"added": {}}]	31	2
682	2021-05-16 10:17:01.578683+00	16	Spices	1	[{"added": {}}]	18	2
683	2021-05-16 10:28:23.641138+00	100	Catch Hing 10Gm	1	[{"added": {}}]	22	2
684	2021-05-16 10:28:47.746629+00	413	/media/product/catch_hing_10gm.png	1	[{"added": {}}]	31	2
685	2021-05-16 10:28:58.346431+00	414	/media/product/catch_hing_comman_2.png	1	[{"added": {}}]	31	2
686	2021-05-16 10:29:11.050294+00	415	/media/product/catch_hing_comman_4.png	1	[{"added": {}}]	31	2
687	2021-05-16 10:29:20.912035+00	416	/media/product/catch_hing_comman_5.png	1	[{"added": {}}]	31	2
688	2021-05-16 10:30:50.70589+00	101	Catch Hing 25Gm	1	[{"added": {}}]	22	2
689	2021-05-16 10:31:06.194409+00	417	/media/product/catch_hing_10gm_3.png	1	[{"added": {}}]	31	2
690	2021-05-16 10:31:17.258214+00	418	/media/product/catch_hing_comman_2_2EwyfPY.png	1	[{"added": {}}]	31	2
691	2021-05-16 10:31:35.890652+00	419	/media/product/catch_hing_comman_3.png	1	[{"added": {}}]	31	2
692	2021-05-16 10:31:49.018452+00	420	/media/product/catch_hing_comman_4_owYvNHq.png	1	[{"added": {}}]	31	2
693	2021-05-16 10:31:58.761957+00	421	/media/product/catch_hing_comman_5_oeklivI.png	1	[{"added": {}}]	31	2
694	2021-05-16 10:33:14.816811+00	102	Catch Hing 50Gm	1	[{"added": {}}]	22	2
695	2021-05-16 10:33:50.344494+00	422	/media/product/catch_hing_50gm.png	1	[{"added": {}}]	31	2
696	2021-05-16 10:34:07.848471+00	423	/media/product/catch_hing_comman_1.png	1	[{"added": {}}]	31	2
697	2021-05-16 10:34:19.104448+00	424	/media/product/catch_hing_comman_4_akHsl0y.png	1	[{"added": {}}]	31	2
698	2021-05-16 10:34:29.508969+00	425	/media/product/catch_hing_comman_5_ygyKEJ5.png	1	[{"added": {}}]	31	2
699	2021-05-16 10:44:42.916849+00	103	MDH Haldi Powder 100Gm	1	[{"added": {}}]	22	2
700	2021-05-16 10:45:01.449766+00	426	/media/product/mdh_haldi_powder_100gm_2.png	1	[{"added": {}}]	31	2
701	2021-05-16 10:45:11.43495+00	427	/media/product/mdh_haldi_powder_100gm_1.png	1	[{"added": {}}]	31	2
702	2021-05-16 10:45:21.243269+00	428	/media/product/mdh_haldi_powder_100gm_3.png	1	[{"added": {}}]	31	2
703	2021-05-17 08:53:43.600948+00	6	Homeopathy	3		20	2
704	2021-05-17 08:53:43.603717+00	5	Ayurvedic	3		20	2
705	2021-05-17 09:59:51.815635+00	2	Gromdy	2	[{"changed": {"fields": ["Title", "Image"]}}]	23	2
706	2021-05-17 11:39:53.489978+00	7	Grocery	1	[{"added": {}}]	24	2
707	2021-05-17 11:40:26.697047+00	7	Grocery	3		24	2
708	2021-05-17 11:52:21.714178+00	8	Grocery	1	[{"added": {}}]	24	2
709	2021-05-17 11:53:37.093832+00	8	Grocery	2	[{"changed": {"fields": ["Image"]}}]	24	2
710	2021-05-17 12:32:08.961032+00	104	Glucon-D 500Gm	1	[{"added": {}}]	22	2
711	2021-05-17 12:32:51.107408+00	429	/media/product/glucon_D_lime_1_VwQt8SZ.png	1	[{"added": {}}]	31	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	prico	order
8	prico	remember
9	prico	prescription
10	prico	otp_login
11	prico	order_status
12	prico	order_item
13	prico	forget_password_otp
14	prico	customer
15	prico	cart
16	cms	aboutus_information
17	cms	benifits
18	cms	category
19	cms	contact_us
20	cms	main_category
21	cms	offers
22	cms	product
23	cms	site_information
24	cms	slider
25	cms	terms_and_conditions
26	cms	vendor
27	cms	side_effect
28	cms	review
29	cms	question
30	cms	offers_product
31	cms	image
32	cms	feature
33	cms	employee
34	cms	available
35	prico	notification
36	prico	custid
37	prico	delivery_charge
38	prico	emailnotification
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-05-10 14:16:00.386655+00
2	auth	0001_initial	2021-05-10 14:16:00.475608+00
3	admin	0001_initial	2021-05-10 14:16:00.501416+00
4	admin	0002_logentry_remove_auto_add	2021-05-10 14:16:00.509599+00
5	admin	0003_logentry_add_action_flag_choices	2021-05-10 14:16:00.518123+00
6	contenttypes	0002_remove_content_type_name	2021-05-10 14:16:00.534934+00
7	auth	0002_alter_permission_name_max_length	2021-05-10 14:16:00.544026+00
8	auth	0003_alter_user_email_max_length	2021-05-10 14:16:00.552863+00
9	auth	0004_alter_user_username_opts	2021-05-10 14:16:00.561498+00
10	auth	0005_alter_user_last_login_null	2021-05-10 14:16:00.571792+00
11	auth	0006_require_contenttypes_0002	2021-05-10 14:16:00.573911+00
12	auth	0007_alter_validators_add_error_messages	2021-05-10 14:16:00.582068+00
13	auth	0008_alter_user_username_max_length	2021-05-10 14:16:00.594403+00
14	auth	0009_alter_user_last_name_max_length	2021-05-10 14:16:00.603155+00
15	auth	0010_alter_group_name_max_length	2021-05-10 14:16:00.612807+00
16	auth	0011_update_proxy_permissions	2021-05-10 14:16:00.620998+00
17	auth	0012_alter_user_first_name_max_length	2021-05-10 14:16:00.629471+00
18	cms	0001_initial	2021-05-10 14:16:00.945649+00
19	prico	0001_initial	2021-05-10 14:16:01.206553+00
20	sessions	0001_initial	2021-05-10 14:16:01.222889+00
21	cms	0002_slider_image	2021-05-11 19:51:59.908134+00
22	prico	0002_notification	2021-05-12 23:07:34.188257+00
23	prico	0003_notification_date	2021-05-12 23:07:34.207834+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
0p73783gaypzsx33n46eqdfnowo8myn0	.eJxVjEsOAiEQBe_C2hAagWZcup8zEOgGGTWQzGdlvLtOMgvdvqp6LxHittawLXkOE4uLAHH63VKkR2474Htsty6pt3WektwVedBFjp3z83q4fwc1LvVbI3qvBgfEqFhDLlqDRV2Ug0xUGAcEJEPOFa_9mclEtMomZmMY_CDeH8XpN1U:1lgHT8:xC8C9Ttpx6nW-GPv5xJiY1uZeOJpydpXZx6LceCgLxI	2021-05-25 01:45:54.133475+00
m3gin3620ldrxlud71nwyvej68yzfjwi	.eJxVjEsOAiEQBe_C2pCG4adL956BNHQrowaSYWZlvLuSzEKX71WlXiLitpa4dV7iTOIktDj8fgnzg-sAdMd6azK3ui5zkkORO-3y0oif5939CxTsZWQzkCXn0LrgHU9GaYsJKHkVwCkFLrM5ZmL4bvAGrWZ91agx2cmaIN4fxQQ28w:1lgHgz:fy12JyhkCKXvG24M9pmUNlCofSldxcoR4CBVFZkjWOo	2021-05-25 02:00:13.654532+00
2z9ttj0kun0ybbcauyzg4h6nd1byvbl4	.eJxVjEEOwiAQRe_C2hAopTAu3fcMZBgGqZqSlHZlvLtt0oVu_3vvv0XAbS1ha7yEKYmrMOLyu0WkJ88HSA-c71VSnddlivJQ5EmbHGvi1-10_w4KtrLXDj0Y4DQkIPAxexiSUjkqYs_GOtt15NBq6DVxJAWsdqfn3BlUpLP4fAHwazhM:1lgJRu:VE-MQIytyFI0zRxK7vulaJsMlG5C1Th44y7JbzC6fVA	2021-05-25 03:52:46.863521+00
08qcu58isgp6uilhoh3g4mbd4h1x5yfb	.eJxVjEsOAiEQBe_C2hAagWZcup8zEOgGGTWQzGdlvLtOMgvdvqp6LxHittawLXkOE4uLAHH63VKkR2474Htsty6pt3WektwVedBFjp3z83q4fwc1LvVbI3qvBgfEqFhDLlqDRV2Ug0xUGAcEJEPOFa_9mclEtMomZmMY_CDeH8XpN1U:1lhQNQ:5hqtPaGZrmxdHFTgQdKUx2M5a5Vk4eZAAWE-UOqIZr8	2021-05-28 05:28:44.702199+00
506cd4z0cvkm6yzsnwl5ix3405femtyf	.eJxVjEsOAiEQBe_C2hAagWZcup8zEOgGGTWQzGdlvLtOMgvdvqp6LxHittawLXkOE4uLAHH63VKkR2474Htsty6pt3WektwVedBFjp3z83q4fwc1LvVbI3qvBgfEqFhDLlqDRV2Ug0xUGAcEJEPOFa_9mclEtMomZmMY_CDeH8XpN1U:1lhayr:OGjUyWM_v3PlnUGGtvKfrHIvvuPJHgcndkSCS78U1Yk	2021-05-28 16:48:05.391571+00
wgjqeeh2cs063t1l0oe00mif6vx49lyl	.eJxVjEsOAiEQBe_C2hAagWZcup8zEOgGGTWQzGdlvLtOMgvdvqp6LxHittawLXkOE4uLAHH63VKkR2474Htsty6pt3WektwVedBFjp3z83q4fwc1LvVbI3qvBgfEqFhDLlqDRV2Ug0xUGAcEJEPOFa_9mclEtMomZmMY_CDeH8XpN1U:1lhu8k:j6T3rfa4Ib3wI_iHw5YjX_Xvnn1hJ50vCF8NF_9vX54	2021-05-29 13:15:34.431535+00
\.


--
-- Data for Name: prico_cart; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.prico_cart (id, quantity, product_id, user_id) FROM stdin;
5	1	21	1
6	1	23	4
7	1	24	4
8	1	29	4
12	1	26	1
\.


--
-- Data for Name: prico_customer; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.prico_customer (id, age, gender, user_id) FROM stdin;
1	21	male	2
2	21	male	1
3	23	male	3
4	21	male	4
\.


--
-- Data for Name: prico_forget_password_otp; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.prico_forget_password_otp (id, otp, attempt, user_id) FROM stdin;
\.


--
-- Data for Name: prico_notification; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.prico_notification (id, subject, content, link, seen, user_id, date) FROM stdin;
1	 welcome to matsl.	welcome to matsl suchit chouhan .\n\n We hope we will provide you a better service.	/	t	4	2021-05-12 23:11:38.715615+00
\.


--
-- Data for Name: prico_order; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.prico_order (id, uid, location, zipcode, address, mobile, notes, date, tolal_tax, tolal_item_price, delivery_charge, amount, mode, status, is_verify, user_id) FROM stdin;
1	mEjPOBtY	Noida	201301	a 21  chhijarsi 	7838067051	kuch nhi	2021-05-11 03:54:35.441014+00	5	30	20	51	cod	pending	t	3
\.


--
-- Data for Name: prico_order_item; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.prico_order_item (id, quantity, price, order_id, product_id) FROM stdin;
\.


--
-- Data for Name: prico_order_status; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.prico_order_status (id, name, description, date, order_id) FROM stdin;
1	packed	this product is packed	2021-05-11 03:56:44.35572+00	1
\.


--
-- Data for Name: prico_otp_login; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.prico_otp_login (id, otp, attempt, user_id) FROM stdin;
\.


--
-- Data for Name: prico_prescription; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.prico_prescription (id, order_id) FROM stdin;
\.


--
-- Data for Name: prico_remember; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.prico_remember (id, quantity, product_id, user_id) FROM stdin;
3	1	23	4
4	1	24	4
5	1	29	4
7	1	26	1
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 152, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 6, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: cms_aboutus_information_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_aboutus_information_id_seq', 4, true);


--
-- Name: cms_available_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_available_id_seq', 1, false);


--
-- Name: cms_benifits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_benifits_id_seq', 1, true);


--
-- Name: cms_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_category_id_seq', 16, true);


--
-- Name: cms_contact_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_contact_us_id_seq', 1, true);


--
-- Name: cms_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_employee_id_seq', 2, true);


--
-- Name: cms_feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_feature_id_seq', 1, true);


--
-- Name: cms_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_image_id_seq', 429, true);


--
-- Name: cms_main_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_main_category_id_seq', 8, true);


--
-- Name: cms_offers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_offers_id_seq', 6, true);


--
-- Name: cms_offers_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_offers_product_id_seq', 14, true);


--
-- Name: cms_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_product_id_seq', 104, true);


--
-- Name: cms_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_question_id_seq', 1, false);


--
-- Name: cms_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_review_id_seq', 1, true);


--
-- Name: cms_side_effect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_side_effect_id_seq', 1, false);


--
-- Name: cms_site_information_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_site_information_id_seq', 3, true);


--
-- Name: cms_slider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_slider_id_seq', 8, true);


--
-- Name: cms_terms_and_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_terms_and_conditions_id_seq', 1, true);


--
-- Name: cms_vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.cms_vendor_id_seq', 2, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 711, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 38, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- Name: prico_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.prico_cart_id_seq', 15, true);


--
-- Name: prico_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.prico_customer_id_seq', 6, true);


--
-- Name: prico_forget_password_otp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.prico_forget_password_otp_id_seq', 1, false);


--
-- Name: prico_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.prico_notification_id_seq', 3, true);


--
-- Name: prico_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.prico_order_id_seq', 1, true);


--
-- Name: prico_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.prico_order_item_id_seq', 1, true);


--
-- Name: prico_order_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.prico_order_status_id_seq', 1, true);


--
-- Name: prico_otp_login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.prico_otp_login_id_seq', 1, false);


--
-- Name: prico_prescription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.prico_prescription_id_seq', 1, false);


--
-- Name: prico_remember_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.prico_remember_id_seq', 7, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cms_aboutus_information cms_aboutus_information_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_aboutus_information
    ADD CONSTRAINT cms_aboutus_information_pkey PRIMARY KEY (id);


--
-- Name: cms_available cms_available_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_available
    ADD CONSTRAINT cms_available_pkey PRIMARY KEY (id);


--
-- Name: cms_benifits cms_benifits_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_benifits
    ADD CONSTRAINT cms_benifits_pkey PRIMARY KEY (id);


--
-- Name: cms_category cms_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_category
    ADD CONSTRAINT cms_category_pkey PRIMARY KEY (id);


--
-- Name: cms_contact_us cms_contact_us_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_contact_us
    ADD CONSTRAINT cms_contact_us_pkey PRIMARY KEY (id);


--
-- Name: cms_employee cms_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_employee
    ADD CONSTRAINT cms_employee_pkey PRIMARY KEY (id);


--
-- Name: cms_feature cms_feature_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_feature
    ADD CONSTRAINT cms_feature_pkey PRIMARY KEY (id);


--
-- Name: cms_image cms_image_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_image
    ADD CONSTRAINT cms_image_pkey PRIMARY KEY (id);


--
-- Name: cms_main_category cms_main_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_main_category
    ADD CONSTRAINT cms_main_category_pkey PRIMARY KEY (id);


--
-- Name: cms_offers cms_offers_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_offers
    ADD CONSTRAINT cms_offers_pkey PRIMARY KEY (id);


--
-- Name: cms_offers_product cms_offers_product_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_offers_product
    ADD CONSTRAINT cms_offers_product_pkey PRIMARY KEY (id);


--
-- Name: cms_product cms_product_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_product
    ADD CONSTRAINT cms_product_pkey PRIMARY KEY (id);


--
-- Name: cms_question cms_question_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_question
    ADD CONSTRAINT cms_question_pkey PRIMARY KEY (id);


--
-- Name: cms_review cms_review_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_review
    ADD CONSTRAINT cms_review_pkey PRIMARY KEY (id);


--
-- Name: cms_side_effect cms_side_effect_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_side_effect
    ADD CONSTRAINT cms_side_effect_pkey PRIMARY KEY (id);


--
-- Name: cms_site_information cms_site_information_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_site_information
    ADD CONSTRAINT cms_site_information_pkey PRIMARY KEY (id);


--
-- Name: cms_slider cms_slider_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_slider
    ADD CONSTRAINT cms_slider_pkey PRIMARY KEY (id);


--
-- Name: cms_terms_and_conditions cms_terms_and_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_terms_and_conditions
    ADD CONSTRAINT cms_terms_and_conditions_pkey PRIMARY KEY (id);


--
-- Name: cms_vendor cms_vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_vendor
    ADD CONSTRAINT cms_vendor_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: prico_cart prico_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_cart
    ADD CONSTRAINT prico_cart_pkey PRIMARY KEY (id);


--
-- Name: prico_customer prico_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_customer
    ADD CONSTRAINT prico_customer_pkey PRIMARY KEY (id);


--
-- Name: prico_forget_password_otp prico_forget_password_otp_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_forget_password_otp
    ADD CONSTRAINT prico_forget_password_otp_pkey PRIMARY KEY (id);


--
-- Name: prico_notification prico_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_notification
    ADD CONSTRAINT prico_notification_pkey PRIMARY KEY (id);


--
-- Name: prico_order_item prico_order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_order_item
    ADD CONSTRAINT prico_order_item_pkey PRIMARY KEY (id);


--
-- Name: prico_order prico_order_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_order
    ADD CONSTRAINT prico_order_pkey PRIMARY KEY (id);


--
-- Name: prico_order_status prico_order_status_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_order_status
    ADD CONSTRAINT prico_order_status_pkey PRIMARY KEY (id);


--
-- Name: prico_otp_login prico_otp_login_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_otp_login
    ADD CONSTRAINT prico_otp_login_pkey PRIMARY KEY (id);


--
-- Name: prico_prescription prico_prescription_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_prescription
    ADD CONSTRAINT prico_prescription_pkey PRIMARY KEY (id);


--
-- Name: prico_remember prico_remember_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_remember
    ADD CONSTRAINT prico_remember_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cms_available_product_id_b0fc8614; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_available_product_id_b0fc8614 ON public.cms_available USING btree (product_id);


--
-- Name: cms_available_vendor_id_fa18badb; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_available_vendor_id_fa18badb ON public.cms_available USING btree (vendor_id);


--
-- Name: cms_category_main_category_id_942527c2; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_category_main_category_id_942527c2 ON public.cms_category USING btree (main_category_id);


--
-- Name: cms_category_url_slug_76955788; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_category_url_slug_76955788 ON public.cms_category USING btree (url_slug);


--
-- Name: cms_category_url_slug_76955788_like; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_category_url_slug_76955788_like ON public.cms_category USING btree (url_slug varchar_pattern_ops);


--
-- Name: cms_employee_user_id_1d32a81a; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_employee_user_id_1d32a81a ON public.cms_employee USING btree (user_id);


--
-- Name: cms_feature_product_id_a9bd9b15; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_feature_product_id_a9bd9b15 ON public.cms_feature USING btree (product_id);


--
-- Name: cms_image_product_id_76b44562; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_image_product_id_76b44562 ON public.cms_image USING btree (product_id);


--
-- Name: cms_main_category_url_slug_aadc4981; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_main_category_url_slug_aadc4981 ON public.cms_main_category USING btree (url_slug);


--
-- Name: cms_main_category_url_slug_aadc4981_like; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_main_category_url_slug_aadc4981_like ON public.cms_main_category USING btree (url_slug varchar_pattern_ops);


--
-- Name: cms_offers_product_offers_id_96651e68; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_offers_product_offers_id_96651e68 ON public.cms_offers_product USING btree (offers_id);


--
-- Name: cms_offers_product_product_id_5eec0c7f; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_offers_product_product_id_5eec0c7f ON public.cms_offers_product USING btree (product_id);


--
-- Name: cms_offers_url_slug_228836d9; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_offers_url_slug_228836d9 ON public.cms_offers USING btree (url_slug);


--
-- Name: cms_offers_url_slug_228836d9_like; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_offers_url_slug_228836d9_like ON public.cms_offers USING btree (url_slug varchar_pattern_ops);


--
-- Name: cms_product_category_id_b416490b; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_product_category_id_b416490b ON public.cms_product USING btree (category_id);


--
-- Name: cms_product_url_slug_6f582c4f; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_product_url_slug_6f582c4f ON public.cms_product USING btree (url_slug);


--
-- Name: cms_product_url_slug_6f582c4f_like; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_product_url_slug_6f582c4f_like ON public.cms_product USING btree (url_slug varchar_pattern_ops);


--
-- Name: cms_question_product_id_835ffb61; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_question_product_id_835ffb61 ON public.cms_question USING btree (product_id);


--
-- Name: cms_review_product_id_9dca8fd6; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_review_product_id_9dca8fd6 ON public.cms_review USING btree (product_id);


--
-- Name: cms_review_user_id_e550dd2f; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_review_user_id_e550dd2f ON public.cms_review USING btree (user_id);


--
-- Name: cms_side_effect_product_id_84342396; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_side_effect_product_id_84342396 ON public.cms_side_effect USING btree (product_id);


--
-- Name: cms_vendor_user_id_bcb2925a; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX cms_vendor_user_id_bcb2925a ON public.cms_vendor USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: prico_cart_product_id_3dc6f72d; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX prico_cart_product_id_3dc6f72d ON public.prico_cart USING btree (product_id);


--
-- Name: prico_cart_user_id_6bf726d1; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX prico_cart_user_id_6bf726d1 ON public.prico_cart USING btree (user_id);


--
-- Name: prico_customer_user_id_71c03f9f; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX prico_customer_user_id_71c03f9f ON public.prico_customer USING btree (user_id);


--
-- Name: prico_forget_password_otp_user_id_1c222d8b; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX prico_forget_password_otp_user_id_1c222d8b ON public.prico_forget_password_otp USING btree (user_id);


--
-- Name: prico_notification_user_id_3e446b1c; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX prico_notification_user_id_3e446b1c ON public.prico_notification USING btree (user_id);


--
-- Name: prico_order_item_order_id_aa1c8df8; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX prico_order_item_order_id_aa1c8df8 ON public.prico_order_item USING btree (order_id);


--
-- Name: prico_order_item_product_id_60da92cf; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX prico_order_item_product_id_60da92cf ON public.prico_order_item USING btree (product_id);


--
-- Name: prico_order_status_order_id_bfe8051c; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX prico_order_status_order_id_bfe8051c ON public.prico_order_status USING btree (order_id);


--
-- Name: prico_order_user_id_e48c4866; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX prico_order_user_id_e48c4866 ON public.prico_order USING btree (user_id);


--
-- Name: prico_otp_login_user_id_8a0501df; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX prico_otp_login_user_id_8a0501df ON public.prico_otp_login USING btree (user_id);


--
-- Name: prico_prescription_order_id_c2dac680; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX prico_prescription_order_id_c2dac680 ON public.prico_prescription USING btree (order_id);


--
-- Name: prico_remember_product_id_734eab6d; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX prico_remember_product_id_734eab6d ON public.prico_remember USING btree (product_id);


--
-- Name: prico_remember_user_id_630a3dd5; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX prico_remember_user_id_630a3dd5 ON public.prico_remember USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_available cms_available_product_id_b0fc8614_fk_cms_product_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_available
    ADD CONSTRAINT cms_available_product_id_b0fc8614_fk_cms_product_id FOREIGN KEY (product_id) REFERENCES public.cms_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_available cms_available_vendor_id_fa18badb_fk_cms_vendor_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_available
    ADD CONSTRAINT cms_available_vendor_id_fa18badb_fk_cms_vendor_id FOREIGN KEY (vendor_id) REFERENCES public.cms_vendor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_category cms_category_main_category_id_942527c2_fk_cms_main_category_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_category
    ADD CONSTRAINT cms_category_main_category_id_942527c2_fk_cms_main_category_id FOREIGN KEY (main_category_id) REFERENCES public.cms_main_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_employee cms_employee_user_id_1d32a81a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_employee
    ADD CONSTRAINT cms_employee_user_id_1d32a81a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_feature cms_feature_product_id_a9bd9b15_fk_cms_product_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_feature
    ADD CONSTRAINT cms_feature_product_id_a9bd9b15_fk_cms_product_id FOREIGN KEY (product_id) REFERENCES public.cms_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_image cms_image_product_id_76b44562_fk_cms_product_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_image
    ADD CONSTRAINT cms_image_product_id_76b44562_fk_cms_product_id FOREIGN KEY (product_id) REFERENCES public.cms_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_offers_product cms_offers_product_offers_id_96651e68_fk_cms_offers_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_offers_product
    ADD CONSTRAINT cms_offers_product_offers_id_96651e68_fk_cms_offers_id FOREIGN KEY (offers_id) REFERENCES public.cms_offers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_offers_product cms_offers_product_product_id_5eec0c7f_fk_cms_product_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_offers_product
    ADD CONSTRAINT cms_offers_product_product_id_5eec0c7f_fk_cms_product_id FOREIGN KEY (product_id) REFERENCES public.cms_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_product cms_product_category_id_b416490b_fk_cms_category_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_product
    ADD CONSTRAINT cms_product_category_id_b416490b_fk_cms_category_id FOREIGN KEY (category_id) REFERENCES public.cms_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_question cms_question_product_id_835ffb61_fk_cms_product_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_question
    ADD CONSTRAINT cms_question_product_id_835ffb61_fk_cms_product_id FOREIGN KEY (product_id) REFERENCES public.cms_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_review cms_review_product_id_9dca8fd6_fk_cms_product_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_review
    ADD CONSTRAINT cms_review_product_id_9dca8fd6_fk_cms_product_id FOREIGN KEY (product_id) REFERENCES public.cms_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_review cms_review_user_id_e550dd2f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_review
    ADD CONSTRAINT cms_review_user_id_e550dd2f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_side_effect cms_side_effect_product_id_84342396_fk_cms_product_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_side_effect
    ADD CONSTRAINT cms_side_effect_product_id_84342396_fk_cms_product_id FOREIGN KEY (product_id) REFERENCES public.cms_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_vendor cms_vendor_user_id_bcb2925a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.cms_vendor
    ADD CONSTRAINT cms_vendor_user_id_bcb2925a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prico_cart prico_cart_product_id_3dc6f72d_fk_cms_product_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_cart
    ADD CONSTRAINT prico_cart_product_id_3dc6f72d_fk_cms_product_id FOREIGN KEY (product_id) REFERENCES public.cms_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prico_cart prico_cart_user_id_6bf726d1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_cart
    ADD CONSTRAINT prico_cart_user_id_6bf726d1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prico_customer prico_customer_user_id_71c03f9f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_customer
    ADD CONSTRAINT prico_customer_user_id_71c03f9f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prico_forget_password_otp prico_forget_password_otp_user_id_1c222d8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_forget_password_otp
    ADD CONSTRAINT prico_forget_password_otp_user_id_1c222d8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prico_notification prico_notification_user_id_3e446b1c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_notification
    ADD CONSTRAINT prico_notification_user_id_3e446b1c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prico_order_item prico_order_item_order_id_aa1c8df8_fk_prico_order_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_order_item
    ADD CONSTRAINT prico_order_item_order_id_aa1c8df8_fk_prico_order_id FOREIGN KEY (order_id) REFERENCES public.prico_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prico_order_item prico_order_item_product_id_60da92cf_fk_cms_product_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_order_item
    ADD CONSTRAINT prico_order_item_product_id_60da92cf_fk_cms_product_id FOREIGN KEY (product_id) REFERENCES public.cms_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prico_order_status prico_order_status_order_id_bfe8051c_fk_prico_order_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_order_status
    ADD CONSTRAINT prico_order_status_order_id_bfe8051c_fk_prico_order_id FOREIGN KEY (order_id) REFERENCES public.prico_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prico_order prico_order_user_id_e48c4866_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_order
    ADD CONSTRAINT prico_order_user_id_e48c4866_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prico_otp_login prico_otp_login_user_id_8a0501df_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_otp_login
    ADD CONSTRAINT prico_otp_login_user_id_8a0501df_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prico_prescription prico_prescription_order_id_c2dac680_fk_prico_order_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_prescription
    ADD CONSTRAINT prico_prescription_order_id_c2dac680_fk_prico_order_id FOREIGN KEY (order_id) REFERENCES public.prico_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prico_remember prico_remember_product_id_734eab6d_fk_cms_product_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_remember
    ADD CONSTRAINT prico_remember_product_id_734eab6d_fk_cms_product_id FOREIGN KEY (product_id) REFERENCES public.cms_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prico_remember prico_remember_user_id_630a3dd5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY public.prico_remember
    ADD CONSTRAINT prico_remember_user_id_630a3dd5_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

