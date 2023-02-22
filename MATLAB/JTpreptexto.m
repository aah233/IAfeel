function doc = JTpreptexto(x)


% Tokenize the text.
doc = tokenizedDocument(x);

% Convert to lowercase.
doc = lower(doc);

% Erase punctuation.
%doc = erasePunctuation(doc);

end