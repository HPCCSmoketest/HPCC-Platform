/*##############################################################################

    HPCC SYSTEMS software Copyright (C) 2012 HPCC Systems®.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
############################################################################## */

#option ('allKeyedFiltersOptional', true);
i := index({ string30 surname, string20 forename, unsigned age } , {}, 'myDummyKey');

filtered1  := i(WILD(surname) AND KEYED(forename = 'Gavin'));
filtered2  := i(WILD(surname) AND KEYED(forename = 'Gavin', OPT));
filtered3  := i(WILD(surname) AND KEYED(forename = 'Gavin', OPT(TRUE)));
filtered4  := i(WILD(surname) AND KEYED(forename = 'Gavin', OPT(FALSE)));

sequential(
    output(filtered1);
    output(filtered2);
    output(filtered3);
    output(filtered4);
    output('done')
);
