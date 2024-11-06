CREATE TABLE [meta].[mw_hs_section_code] (
    [hs_section_code] CHAR(2),
    [hs_section_desc] VARCHAR(256) UNIQUE NOT NULL,

    CONSTRAINT [pk_hs_section_code] PRIMARY KEY NONCLUSTERED ([hs_section_code])
);

CREATE TABLE [meta].[mw_hs_chapter_code] (
    [hs_chapter_code] CHAR(2),
    [hs_section_code] CHAR(2) NOT NULL,
    [hs_chapter_desc] VARCHAR(256) UNIQUE NOT NULL,

    CONSTRAINT [pk_hs_chapter_code] PRIMARY KEY NONCLUSTERED ([hs_chapter_code]),

    CONSTRAINT [fk_hs_section_code] FOREIGN KEY ([hs_section_code])
        REFERENCES [meta].[mw_hs_section_code] ([hs_section_code])
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE [meta].[mw_hs_heading_code] (
    [hs_heading_code] CHAR(4),
    [hs_chapter_code] CHAR(2) NOT NULL,
    [hs_heading_desc] VARCHAR(256) UNIQUE NOT NULL,

    CONSTRAINT [pk_hs_heading_code] PRIMARY KEY NONCLUSTERED ([hs_heading_code]),

    CONSTRAINT [fk_hs_chapter_code] FOREIGN KEY ([hs_chapter_code])
        REFERENCES [meta].[mw_hs_chapter_code] ([hs_chapter_code])
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE [meta].[mw_hs_code] (
    [hs_code] CHAR(8),
    
    -- ? harmonized code is unique, and first four characters are heading code
    [hs_heading_code] CHAR(4) NOT NULL,
    [hsc_description] VARCHAR(256) NOT NULL,

    CONSTRAINT [pk_hs_code] PRIMARY KEY NONCLUSTERED ([hs_code]),

    CONSTRAINT [fk_hs_heading_code] FOREIGN KEY ([hs_heading_code])
        REFERENCES [meta].[mw_hs_heading_code] ([hs_heading_code])
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
