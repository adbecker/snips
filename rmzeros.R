df <- df[apply(df[,-1], 1, function(x) !all(x==0)),]

