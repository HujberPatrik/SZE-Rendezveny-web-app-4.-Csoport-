PGDMP  :                     }         
   RendezvenyApp    17.4    17.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388 
   RendezvenyApp    DATABASE     u   CREATE DATABASE "RendezvenyApp" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'hu-HU';
    DROP DATABASE "RendezvenyApp";
                     postgres    false            �            1259    16389    kerveny    TABLE     `  CREATE TABLE public.kerveny (
    id integer NOT NULL,
    statusz text NOT NULL COLLATE pg_catalog."hu-HU-x-icu",
    nev text COLLATE pg_catalog."hu-HU-x-icu",
    email text NOT NULL,
    "telefon" text NOT NULL COLLATE pg_catalog."hu-HU-x-icu",
    letszam integer NOT NULL
);
ALTER TABLE ONLY public.kerveny ALTER COLUMN statusz SET STORAGE MAIN;
    DROP TABLE public.kerveny;
       public         heap r       postgres    false            �            1259    16394    kerveny_id_seq    SEQUENCE     �   ALTER TABLE public.kerveny ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.kerveny_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    217            �          0    16389    kerveny 
   TABLE DATA                 public               postgres    false    217   &       �           0    0    kerveny_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.kerveny_id_seq', 1, false);
          public               postgres    false    218            �   
   x���         