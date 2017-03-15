lhsRec := RECORD
 string lhsstr := '';
 boolean abool;
end;

rhsRec := RECORD
 string5 rhsstr := '';
 unsigned4 auint;
end;

lhs := DATASET(2, TRANSFORM(lhsRec, SELF.lhsstr := (string)COUNTER, SELF.abool := false));
rhs := DATASET(2, TRANSFORM(rhsRec, SELF.rhsstr := (string)COUNTER, SELF.auint := 1), DISTRIBUTED);

slhs := SORT(lhs, lhsstr);
j := JOIN(NOFOLD(slhs), NOFOLD(rhs), LEFT.lhsstr=RIGHT.rhsstr);

srhs := SORT(rhs, rhsstr);
j2 := JOIN(lhs, NOFOLD(srhs), LEFT.lhsstr=RIGHT.rhsstr);

j3 := JOIN(NOFOLD(slhs), NOFOLD(srhs), LEFT.lhsstr=RIGHT.rhsstr);

SEQUENTIAL(
 COUNT(NOFOLD(j));
 COUNT(NOFOLD(j2));
 COUNT(NOFOLD(j3));
);
