SELECT "name" FROM "districts" WHERE "name" LIKE "%(non-op)";

-- SELECT COUNT("name") FROM "districts" WHERE "name" LIKE "%(non-op)"; - 121 rows ✅


/*
┌───────────────────────────┐
│           name            │
├───────────────────────────┤
│ Acton (non-op)            │
│ Adams (non-op)            │
│ Alford (non-op)           │
│ Aquinnah (non-op)         │
│ Ashburnham (non-op)       │
│ Ashby (non-op)            │
│ Ashfield (non-op)         │
│ Athol (non-op)            │
│ Ayer (non-op)             │
│ Barre (non-op)            │
│ Becket (non-op)           │
│ Berlin (non-op)           │
│ Bernardston (non-op)      │
│ Blackstone (non-op)       │
│ Blandford (non-op)        │
│ Bolton (non-op)           │
│ Boxborough (non-op)       │
│ Boylston (non-op)         │
│ Bridgewater (non-op)      │
│ Buckland (non-op)         │
│ Charlemont (non-op)       │
│ Charlton (non-op)         │
│ Chatham (non-op)          │
│ Cheshire (non-op)         │
│ Chester (non-op)          │
│ Chesterfield (non-op)     │
│ Chilmark (non-op)         │
│ Colrain (non-op)          │
│ Cummington (non-op)       │
│ Dalton (non-op)           │
│ Dennis (non-op)           │
│ Devens (non-op)           │
│ Dighton (non-op)          │
│ Dudley (non-op)           │
│ Dunstable (non-op)        │
│ East Brookfield (non-op)  │
│ Egremont (non-op)         │
│ Essex (non-op)            │
│ Freetown (non-op)         │
│ Gill (non-op)             │
│ Goshen (non-op)           │
│ Granville (non-op)        │
│ Great Barrington (non-op) │
│ Groton (non-op)           │
│ Groveland (non-op)        │
│ Hamilton (non-op)         │
│ Hampden (non-op)          │
│ Hanson (non-op)           │
│ Hardwick (non-op)         │
│ Harwich (non-op)          │
│ Hawley (non-op)           │
│ Heath (non-op)            │
│ Hinsdale (non-op)         │
│ Holden (non-op)           │
│ Hubbardston (non-op)      │
│ Huntington (non-op)       │
│ Lakeville (non-op)        │
│ Lancaster (non-op)        │
│ Lanesborough (non-op)     │
│ Leyden (non-op)           │
│ Manchester (non-op)       │
│ Mendon (non-op)           │
│ Merrimac (non-op)         │
│ Middlefield (non-op)      │
│ Millville (non-op)        │
│ Monroe (non-op)           │
│ Montague (non-op)         │
│ Monterey (non-op)         │
│ Montgomery (non-op)       │
│ Mount Washington (non-op) │
│ New Ashford (non-op)      │
│ New Braintree (non-op)    │
│ New Marlborough (non-op)  │
│ New Salem (non-op)        │
│ Newbury (non-op)          │
│ Northfield (non-op)       │
│ Oakham (non-op)           │
│ Otis (non-op)             │
│ Paxton (non-op)           │
│ Pepperell (non-op)        │
│ Peru (non-op)             │
│ Phillipston (non-op)      │
│ Plainfield (non-op)       │
│ Princeton (non-op)        │
│ Raynham (non-op)          │
│ Rehoboth (non-op)         │
│ Rowley (non-op)           │
│ Royalston (non-op)        │
│ Russell (non-op)          │
│ Rutland (non-op)          │
│ Salisbury (non-op)        │
│ Sandisfield (non-op)      │
│ Sheffield (non-op)        │
│ Shelburne (non-op)        │
│ Shirley (non-op)          │
│ Southfield (non-op)       │
│ Southwick (non-op)        │
│ Spencer (non-op)          │
│ Sterling (non-op)         │
│ Stockbridge (non-op)      │
│ Stow (non-op)             │
│ Templeton (non-op)        │
│ Tolland (non-op)          │
│ Townsend (non-op)         │
│ Tyringham (non-op)        │
│ Upton (non-op)            │
│ Warren (non-op)           │
│ Warwick (non-op)          │
│ Washington (non-op)       │
│ Wendell (non-op)          │
│ Wenham (non-op)           │
│ West Brookfield (non-op)  │
│ West Newbury (non-op)     │
│ West Stockbridge (non-op) │
│ West Tisbury (non-op)     │
│ Westminster (non-op)      │
│ Whitman (non-op)          │
│ Wilbraham (non-op)        │
│ Williamstown (non-op)     │
│ Windsor (non-op)          │
│ Yarmouth (non-op)         │
*/