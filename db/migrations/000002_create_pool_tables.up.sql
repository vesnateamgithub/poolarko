CREATE TABLE poolsizes (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  length int(11) NOT NULL DEFAULT '0',
  width int(11) NOT NULL DEFAULT '0',
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY poolsizes_name_unique (name),
  UNIQUE KEY poolsizes_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE pooltechnics (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY pooltechnics_name_unique (name),
  UNIQUE KEY pooltechnics_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE pooltypes (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  pooltechnics_id bigint(20) unsigned DEFAULT NULL,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  desc1 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  desc2 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY pooltypes_name_unique (name),
  UNIQUE KEY pooltypes_number_unique (number),
  KEY pooltypes_pooltechnics_id_foreign (pooltechnics_id),
  CONSTRAINT pooltypes_pooltechnics_id_foreign FOREIGN KEY (pooltechnics_id) REFERENCES pooltechnics (id)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE confs (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  created_id bigint(20) unsigned NOT NULL DEFAULT '0',
  modified_id bigint(20) unsigned NOT NULL DEFAULT '0',
  customer_id bigint(20) unsigned NOT NULL DEFAULT '0',
  assign_id bigint(20) unsigned NOT NULL DEFAULT '0',
  pooltype_id bigint(20) unsigned NOT NULL DEFAULT '0',
  pooledge_id bigint(20) unsigned NOT NULL DEFAULT '0',
  poolsize_id bigint(20) unsigned NOT NULL DEFAULT '0',
  poolsize_custom_size tinyint(1) NOT NULL DEFAULT '0',
  poolsize_length int(11) NOT NULL DEFAULT '0',
  poolsize_width int(11) NOT NULL DEFAULT '0',
  poolsize_depth int(11) NOT NULL DEFAULT '150',
  infi_length_left tinyint(1) NOT NULL DEFAULT '0',
  infi_length_right tinyint(1) NOT NULL DEFAULT '0',
  infi_width_bottom tinyint(1) NOT NULL DEFAULT '0',
  infi_width_top tinyint(1) NOT NULL DEFAULT '0',
  technicsbox_id bigint(20) unsigned NOT NULL DEFAULT '0',
  technicsbox_custom_size tinyint(1) NOT NULL DEFAULT '0',
  technicsbox_length int(11) NOT NULL DEFAULT '0',
  technicsbox_width int(11) NOT NULL DEFAULT '0',
  material_id int(11) NOT NULL DEFAULT '0',
  poolframe_id bigint(20) unsigned NOT NULL DEFAULT '0',
  poolform_id bigint(20) unsigned NOT NULL DEFAULT '0',
  colorvari_id bigint(20) unsigned NOT NULL DEFAULT '0',
  steps bigint(20) unsigned NOT NULL DEFAULT '5',
  skimmertype_id bigint(20) unsigned NOT NULL DEFAULT '0',
  poolwater_id bigint(20) unsigned NOT NULL DEFAULT '0',
  electro_id bigint(20) unsigned NOT NULL DEFAULT '0',
  whirlpool_id bigint(20) unsigned NOT NULL DEFAULT '0',
  ventil_id bigint(20) unsigned NOT NULL DEFAULT '0',
  led_id bigint(20) unsigned NOT NULL DEFAULT '0',
  leds int(11) NOT NULL DEFAULT '0',
  leds_top int(11) NOT NULL DEFAULT '0',
  leds_right int(11) NOT NULL DEFAULT '0',
  leds_bottom int(11) NOT NULL DEFAULT '0',
  leds_left int(11) NOT NULL DEFAULT '0',
  ledremote_id bigint(20) unsigned NOT NULL DEFAULT '0',
  has_ledremote tinyint(1) NOT NULL DEFAULT '0',
  gsa_id bigint(20) unsigned NOT NULL DEFAULT '0',
  technicsboxpos_id int(11) NOT NULL DEFAULT '0',
  poolframe_edge_color_id int(11) NOT NULL DEFAULT '0',
  poolframe_grid_color_id int(11) NOT NULL DEFAULT '0',
  pool_walls_color_id int(11) NOT NULL DEFAULT '0',
  pool_bottom_color_id int(11) NOT NULL DEFAULT '0',
  pool_steps_color_id int(11) NOT NULL DEFAULT '0',
  pool_stepsedge_color_id int(11) NOT NULL DEFAULT '0',
  pool_technicsbox_color_id int(11) NOT NULL DEFAULT '0',
  status int(11) NOT NULL DEFAULT '0',
  template tinyint(1) NOT NULL DEFAULT '0',
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=464 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE sizechanges (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  pooltype_id bigint(20) unsigned NOT NULL,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY sizechanges_name_unique (name),
  UNIQUE KEY sizechanges_number_unique (number),
  KEY sizechanges_pooltype_id_foreign (pooltype_id),
  CONSTRAINT sizechanges_pooltype_id_foreign FOREIGN KEY (pooltype_id) REFERENCES pooltypes (id)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE pooledges (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  pooltype_id bigint(20) unsigned NOT NULL,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY pooledges_name_unique (name),
  UNIQUE KEY pooledges_number_unique (number),
  KEY pooledges_pooltype_id_foreign (pooltype_id),
  CONSTRAINT pooledges_pooltype_id_foreign FOREIGN KEY (pooltype_id) REFERENCES pooltypes (id)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE poolframes (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  image varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  has_color tinyint(1) NOT NULL DEFAULT '0',
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY poolframes_name_unique (name),
  UNIQUE KEY poolframes_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE stepsforms (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  type int(11) NOT NULL DEFAULT '0',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  image varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY stepsforms_name_unique (name),
  UNIQUE KEY stepsforms_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE colorvaris (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  image varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY colorvaris_name_unique (name),
  UNIQUE KEY colorvaris_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE pooltype_poolframe (
  pooltype_id bigint(20) unsigned NOT NULL,
  poolframe_id bigint(20) unsigned NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY pooltype_poolframe_pooltype_id_foreign (pooltype_id),
  KEY pooltype_poolframe_poolframe_id_foreign (poolframe_id),
  CONSTRAINT pooltype_poolframe_poolframe_id_foreign FOREIGN KEY (poolframe_id) REFERENCES poolframes (id),
  CONSTRAINT pooltype_poolframe_pooltype_id_foreign FOREIGN KEY (pooltype_id) REFERENCES pooltypes (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE poolbenches (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  desc1 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  ask_for_price tinyint(1) NOT NULL DEFAULT '0',
  image varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  type int(11) NOT NULL DEFAULT '0',
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY poolbenches_name_unique (name),
  UNIQUE KEY poolbenches_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE skimmertypes (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  image varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY skimmertypes_name_unique (name),
  UNIQUE KEY skimmertypes_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE technicsboxes (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  length varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  width varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  depth varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  position int(11) NOT NULL DEFAULT '0',
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY technicsboxes_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE pooltype_technicsbox (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  pooltype_id bigint(20) unsigned NOT NULL,
  technicsbox_id bigint(20) unsigned NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY pooltype_technicsbox_pooltype_id_foreign (pooltype_id),
  KEY pooltype_technicsbox_technicsbox_id_foreign (technicsbox_id),
  CONSTRAINT pooltype_technicsbox_pooltype_id_foreign FOREIGN KEY (pooltype_id) REFERENCES pooltypes (id),
  CONSTRAINT pooltype_technicsbox_technicsbox_id_foreign FOREIGN KEY (technicsbox_id) REFERENCES technicsboxes (id)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE poolwaters (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  desc1 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  desc2 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  desc3 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  desc4 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  desc5 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  image varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY poolwaters_name_unique (name),
  UNIQUE KEY poolwaters_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE electros (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  desc1 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  image varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY electros_name_unique (name),
  UNIQUE KEY electros_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE whirlpools (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  desc1 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  image varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY whirlpools_name_unique (name),
  UNIQUE KEY whirlpools_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE ventils (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  desc1 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  image varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY ventils_name_unique (name),
  UNIQUE KEY ventils_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE poolwater_ventil (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  poolwater_id bigint(20) unsigned NOT NULL,
  ventil_id bigint(20) unsigned NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY poolwater_ventil_poolwater_id_foreign (poolwater_id),
  KEY poolwater_ventil_ventil_id_foreign (ventil_id),
  CONSTRAINT poolwater_ventil_poolwater_id_foreign FOREIGN KEY (poolwater_id) REFERENCES poolwaters (id),
  CONSTRAINT poolwater_ventil_ventil_id_foreign FOREIGN KEY (ventil_id) REFERENCES ventils (id)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE leds (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  desc1 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  image varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  has_remote tinyint(1) NOT NULL DEFAULT '0',
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY leds_name_unique (name),
  UNIQUE KEY leds_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE gsas (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  desc1 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  image varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY gsas_name_unique (name),
  UNIQUE KEY gsas_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE pooltype_gsa (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  pooltype_id bigint(20) unsigned NOT NULL,
  gsa_id bigint(20) unsigned NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY pooltype_gsa_pooltype_id_foreign (pooltype_id),
  KEY pooltype_gsa_gsa_id_foreign (gsa_id),
  CONSTRAINT pooltype_gsa_gsa_id_foreign FOREIGN KEY (gsa_id) REFERENCES gsas (id),
  CONSTRAINT pooltype_gsa_pooltype_id_foreign FOREIGN KEY (pooltype_id) REFERENCES pooltypes (id)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE poolcolors (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  value varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY poolcolors_name_unique (name),
  UNIQUE KEY poolcolors_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE poolframecolors (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  value varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY poolframecolors_name_unique (name),
  UNIQUE KEY poolframecolors_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE technicsboxchanges (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  desc1 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY technicsboxchanges_name_unique (name),
  UNIQUE KEY technicsboxchanges_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE ledremotes (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  price_at decimal(12,2) NOT NULL DEFAULT '0.00',
  price_de decimal(12,2) NOT NULL DEFAULT '0.00',
  price_ch decimal(12,2) NOT NULL DEFAULT '0.00',
  desc1 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY ledremotes_name_unique (name),
  UNIQUE KEY ledremotes_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE formtypes (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY formtypes_name_unique (name),
  UNIQUE KEY formtypes_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE formgroups (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  number varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  desc1 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  desc2 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  desc3 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  image varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY formgroups_name_unique (name),
  UNIQUE KEY formgroups_number_unique (number)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE poolforms (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  formtype_id bigint(20) unsigned DEFAULT NULL,
  formgroup_id bigint(20) unsigned DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY poolforms_formtype_id_foreign (formtype_id),
  KEY poolforms_formgroup_id_foreign (formgroup_id),
  CONSTRAINT poolforms_formgroup_id_foreign FOREIGN KEY (formgroup_id) REFERENCES formgroups (id),
  CONSTRAINT poolforms_formtype_id_foreign FOREIGN KEY (formtype_id) REFERENCES formtypes (id)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE poolform_stepsform (
  poolform_id bigint(20) unsigned NOT NULL,
  stepsform_id bigint(20) unsigned NOT NULL,
  pos int(11) NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY poolform_stepsform_poolform_id_foreign (poolform_id),
  KEY poolform_stepsform_stepsform_id_foreign (stepsform_id),
  CONSTRAINT poolform_stepsform_poolform_id_foreign FOREIGN KEY (poolform_id) REFERENCES poolforms (id),
  CONSTRAINT poolform_stepsform_stepsform_id_foreign FOREIGN KEY (stepsform_id) REFERENCES stepsforms (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE formgroup_stepsform (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  formgroup_id bigint(20) unsigned NOT NULL,
  stepsform_id bigint(20) unsigned NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY formgroup_stepsform_formgroup_id_foreign (formgroup_id),
  KEY formgroup_stepsform_stepsform_id_foreign (stepsform_id),
  CONSTRAINT formgroup_stepsform_formgroup_id_foreign FOREIGN KEY (formgroup_id) REFERENCES formgroups (id),
  CONSTRAINT formgroup_stepsform_stepsform_id_foreign FOREIGN KEY (stepsform_id) REFERENCES stepsforms (id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE formgroup_poolbench (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  formgroup_id bigint(20) unsigned NOT NULL,
  poolbench_id bigint(20) unsigned NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY formgroup_poolbench_formgroup_id_foreign (formgroup_id),
  KEY formgroup_poolbench_poolbench_id_foreign (poolbench_id),
  CONSTRAINT formgroup_poolbench_formgroup_id_foreign FOREIGN KEY (formgroup_id) REFERENCES formgroups (id),
  CONSTRAINT formgroup_poolbench_poolbench_id_foreign FOREIGN KEY (poolbench_id) REFERENCES poolbenches (id)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE poolform_poolbench (
  poolform_id bigint(20) unsigned NOT NULL,
  poolbench_id bigint(20) unsigned NOT NULL,
  pos int(11) NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY poolform_poolbench_poolform_id_foreign (poolform_id),
  KEY poolform_poolbench_poolbench_id_foreign (poolbench_id),
  CONSTRAINT poolform_poolbench_poolbench_id_foreign FOREIGN KEY (poolbench_id) REFERENCES poolbenches (id),
  CONSTRAINT poolform_poolbench_poolform_id_foreign FOREIGN KEY (poolform_id) REFERENCES poolforms (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;








