#!/usr/bin/env python

import bibtexparser as btp

with open("craddock_publications.bib", 'r') as instream:
    full_database = btp.load(instream)
    
journal_database = btp.bibdatabase.BibDatabase()
preprint_database = btp.bibdatabase.BibDatabase()
conference_database = btp.bibdatabase.BibDatabase()
talk_database = btp.bibdatabase.BibDatabase()
    
for journal_entry in full_database.entries:
    if 'inproceedings' in journal_entry['ENTRYTYPE'].lower() or 'abs' in journal_entry['ID'].lower():
        conference_database.entries.append(journal_entry)
    elif 'conference' in journal_entry['ENTRYTYPE'].lower() or 'talk' in journal_entry['ID'].lower():
        talk_database.entries.append(journal_entry)
    elif 'article' in journal_entry['ENTRYTYPE'].lower() and 'preprint' in journal_entry['ID'].lower():
        preprint_database.entries.append(journal_entry)
    elif 'article' in journal_entry['ENTRYTYPE'].lower() or 'paper' in journal_entry['ID'].lower:
        journal_database.entries.append(journal_entry)
    else:
        print("Don't know how to handle {0}".format(journal_entry))
        
writer = btp.bwriter.BibTexWriter()
writer.indent = '    '     # indent entries with 4 spaces instead of one

with open("ccraddock_conf_pubs.bib","w") as ostream:
    ostream.write(writer.write(conference_database))

with open("ccraddock_invited_talks.bib","w") as ostream:
    ostream.write(writer.write(talk_database))
    
with open("ccraddock_preprints.bib","w") as ostream:
    ostream.write(writer.write(preprint_database))
    
with open("ccraddock_journal_pubs.bib","w") as ostream:
    ostream.write(writer.write(journal_database))