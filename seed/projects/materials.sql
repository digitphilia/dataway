INSERT INTO projects.mw_material_type (material_type_id, material_type_name, material_type_desc) VALUES
    ('CM', 'Commodity Materials', 'Typically bought/sold in their natural form.'),
    ('FG', 'Finished Goods', 'Typically bought/sold in their finished form.'),
    ('PM', 'Processed Materials', 'Typically bought/sold in their finished form.'),
    ('MC', 'Machinery Components', 'Typically bought/sold in their finished form.'),
    ('RM', 'Raw Materials', 'Minimally processed to make finished goods.');


INSERT INTO projects.mw_material_subtype (material_subtype_id, material_type_id, material_subtype_name, material_subtype_desc) VALUES
    ('ADH', 'RM', 'Raw Adhesives Material', 'Adhesive materials used for manufacturing.'),
    ('CHM', 'RM', 'Chemical Materials', 'Raw chemicals used for manufacturing.'),
    ('COP', 'RM', 'Copolymers', 'Raw copolymers used for manufacturing.'),
    ('INS', 'RM', 'Inorganic Materials', 'Raw inorganic materials used for manufacturing.'),
    ('ORG', 'RM', 'Organic Materials', 'Raw organic materials used for manufacturing.'),
    ('POL', 'RM', 'Polymer Materials', 'Raw polymer materials used for manufacturing.');


INSERT INTO projects.mw_matetial_code (material_code, material_type_id, material_subtype_id, material_name) VALUES
    ('RM-ORG-BACRY', 'RM', 'ORG', 'Butyl Acrylate'),
    ('RM-ORG-CARBZ', 'RM', 'ORG', 'Carbazole'),
    ('RM-ORG-CLORA', 'RM', 'ORG', 'Chloranil'),
    ('RM-OTH-CYANO', 'RM', NULL, 'Cyanoacrylate'),
    ('RM-OTH-TBUTL', 'RM', NULL, 'Tert-Butyl Acrylate'),
    ('RM-POL-EPOXY', 'RM', 'POL', 'Epoxy Resin'),
    ('RM-COP-NAPTH', 'RM', 'COP', 'Naphthol'),
    ('RM-POL-PVA00', 'RM', 'POL', 'Polyvinyl Alcohol'),
    ('RM-POL-RUBER', 'RM', 'POL', 'Synthetic Rubber'),
    ('RM-COP-VAM00', 'RM', 'COP', 'Vinyl Acetate Monomer'),
    ('RM-COP-VAE00', 'RM', 'COP', 'Vinyl Acetate Ethylene'),
    ('RM-POL-STY00', 'RM', 'POL', 'Styrene'),
    ('RM-COP-EVA00', 'RM', 'COP', 'Ethylene Vinyl Acetate'),
    ('FG-OTH-GLSTK', 'FG', NULL, 'Glue Stick'),
    ('FG-OTH-PU270', 'FG', NULL, 'PU 270'),
    ('FG-OTH-MSKTP', 'FG', NULL, 'Masking Tape'),
    ('RM-ORG-TOLUN', 'RM', 'ORG', 'Toluene'),
    ('RM-INS-TIO20', 'RM', 'INS', 'Titanium Dioxide'),
    ('MC-OTH-CVRLR', 'MC', NULL, 'Conveyor Roller'),
    ('MC-OTH-PWRLR', 'MC', NULL, 'Power Moller'),
    ('MC-OTH-CNBRL', 'MC', NULL, 'Connection Bridge Roller'),
    ('MC-OTH-CNXBG', 'MC', NULL, 'Connection Bridge'),
    ('MC-OTH-DORNG', 'MC', NULL, 'Double O-RING Roller');
