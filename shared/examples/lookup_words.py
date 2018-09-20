from genesis.tools import lextagger as LT


sentence = "I like oranges and apples"

# run the spacy nlp module
syntax_parsed = LT.nlp(sentence)

for token in syntax_parsed:
    print(token, token.pos_, token.dep_, LT.deep_syntax(token))

print("+++++")

for token in syntax_parsed:
    print(token, LT.lookup_all(token))

# lookup like independently
lexicon_like, ontology_like = LT.lookup_all(syntax_parsed[1])

# lets take the second returned entry from the lexicon lookup
wlike = lexicon_like[1]

# or the first ontology lookup
score, wlike = ontology_like[0]


print("+++++")
print(wlike.wclass.onttype)

# you should really just explore from here
