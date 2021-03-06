/*##############################################################################
## HPCC SYSTEMS software Copyright (C) 2019 HPCC Systems®.  All rights reserved.
############################################################################## */

IMPORT Std;


EXPORT TestCrypto_Hash := MODULE

  EXPORT TestSupportedHash := MODULE
    EXPORT TSH01 := ASSERT(Std.Crypto.SupportedHashAlgorithms() = ['SHA1', 'SHA224', 'SHA256', 'SHA384', 'SHA512']);
  END;

  EXPORT TestHashSHA1 := MODULE
    EXPORT hashModuleSHA1 := Std.Crypto.Hashing('sha1');
    EXPORT DATA h1 := hashModuleSHA1.Hash((DATA)'SHA1The quick brown fox jumps over the lazy dog');
    EXPORT TH01 := ASSERT(h1 = (DATA)x'23BAFEB89163FFC27029B3736311810FD4BDFD9D');
  END;

  EXPORT TestHashSHA224 := MODULE
    EXPORT hashModuleSHA224 := Std.Crypto.Hashing('SHA224');
    EXPORT DATA h1 := hashModuleSHA224.Hash((DATA)'SHA224The quick brown fox jumps over the lazy dog');
    EXPORT TH01 := ASSERT(h1 = (DATA)x'FE3E6060CE32A22BAC04E7CB699942516E8CFA69090C9543526B6FEF');
  END;

  EXPORT TestHashSHA256 := MODULE
    EXPORT hashModuleSHA256 := Std.Crypto.Hashing('SHA256');
    EXPORT DATA h1 := hashModuleSHA256.Hash((DATA)'SHA256The quick brown fox jumps over the lazy dog');
    EXPORT TH01 := ASSERT(h1 = (DATA)x'10E051175BC5400D5F3B6D9953DCB17677B4B9493E178F47C35D9D8A8DB7D510');
  END;

  EXPORT TestHashSHA384 := MODULE
    EXPORT hashModuleSHA384 := Std.Crypto.Hashing('SHA384');
    EXPORT DATA h1 := hashModuleSHA384.Hash((DATA)'SHA384The quick brown fox jumps over the lazy dog');
    EXPORT TH01 := ASSERT(h1 = (DATA)x'5934D11571137F45423D001CD52092AE911F98B99335C867D0AB1B684C47F761985CD52E94B24DE2560A37F368CC8F9C');
  END;

  EXPORT TestHashSHA512 := MODULE
    EXPORT hashModuleSHA512 := Std.Crypto.Hashing('SHA512');
    EXPORT DATA h1 := hashModuleSHA512.Hash((DATA)'SHA512The quick brown fox jumps over the lazy dog');
    EXPORT TH01 := ASSERT(h1 = (DATA)x'18C8C050337567DFB8AB37B6D7132404A2FD0A9104F78C7A981283DF4AF2B84CF0A88A7D25D6E2640A5B176CA7BF453B60026A9A88507C6B0AF352F185AB831D');
  END;

  EXPORT TestHashSHACombined := MODULE
    EXPORT hashModuleSHA1   := Std.Crypto.Hashing('sha1');
    EXPORT hashModuleSHA224 := Std.Crypto.Hashing('SHA224');
    EXPORT hashModuleSHA256 := Std.Crypto.Hashing('SHA256');
    EXPORT hashModuleSHA384 := Std.Crypto.Hashing('SHA384');
    EXPORT hashModuleSHA512 := Std.Crypto.Hashing('SHA512');

    EXPORT DATA h1   := hashModuleSHA1.Hash(  (DATA)'SHA1The quick brown fox jumps over the lazy dog');
    EXPORT DATA h224 := hashModuleSHA224.Hash((DATA)'SHA224The quick brown fox jumps over the lazy dog');
    EXPORT DATA h256 := hashModuleSHA256.Hash((DATA)'SHA256The quick brown fox jumps over the lazy dog');
    EXPORT DATA h384 := hashModuleSHA384.Hash((DATA)'SHA384The quick brown fox jumps over the lazy dog');
    EXPORT DATA h512 := hashModuleSHA512.Hash((DATA)'SHA512The quick brown fox jumps over the lazy dog');

    EXPORT TH01  := ASSERT(h1   = (DATA)x'23BAFEB89163FFC27029B3736311810FD4BDFD9D');
    EXPORT TH224 := ASSERT(h224 = (DATA)x'FE3E6060CE32A22BAC04E7CB699942516E8CFA69090C9543526B6FEF');
    EXPORT TH256 := ASSERT(h256 = (DATA)x'10E051175BC5400D5F3B6D9953DCB17677B4B9493E178F47C35D9D8A8DB7D510');
    EXPORT TH384 := ASSERT(h384 = (DATA)x'5934D11571137F45423D001CD52092AE911F98B99335C867D0AB1B684C47F761985CD52E94B24DE2560A37F368CC8F9C');
    EXPORT TH512 := ASSERT(h512 = (DATA)x'18C8C050337567DFB8AB37B6D7132404A2FD0A9104F78C7A981283DF4AF2B84CF0A88A7D25D6E2640A5B176CA7BF453B60026A9A88507C6B0AF352F185AB831D');
  END;

END;

