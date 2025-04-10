INSERT INTO projects.mw_material_type (material_type_id, material_type_name, material_type_desc) VALUES
    ('CM', 'Commodity Materials', 'Typically bought/sold in their natural form.'),
    ('FG', 'Finished Goods', 'Typically bought/sold in their finished form.'),
    ('PM', 'Processed Materials', 'Typically bought/sold in their finished form.'),
    ('MC', 'Machinery Components', 'Typically bought/sold in their finished form.'),
    ('RM', 'Raw Materials', 'Minimally processed to make finished goods.');


INSERT INTO projects.mw_material_subtype (material_subtype_id, material_type_id, material_subtype_name, material_subtype_desc) VALUES
    ('CHM', 'RM', 'Chemical Materials', 'Raw chemicals used for manufacturing.'),
    ('ADH', 'RM', 'Raw Adhesives Material', 'Adhesive materials used for manufacturing.');
