/*##############################################################################

    HPCC SYSTEMS software Copyright (C) 2020 HPCC Systems®.

    Licensed under the Apache License, Version 2.0 (the 'License');
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an 'AS IS' BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
############################################################################## */
//version parallel=false
//version parallel=true,nothor

import ^ as root;
optParallel := #IFDEFINED(root.parallel, false);

#option ('parallelWorkflow', optParallel);
#option('numWorkflowThreads', 5);
//When executed in parallel, this query should be significantly faster

Import sleep from std.System.Debug;

display(Integer8 thisInteger) := FUNCTION
  ds := dataset([thisInteger], {Integer8 value});
  RETURN Output(ds, NAMED('logging'), EXTEND);
END;

a1 := sleep(1000) : independent;
a2 := sleep(1001) : independent;
a3 := sleep(1002) : independent;
a4 := sleep(1003) : independent;
a5 := sleep(1004) : independent;

b := PARALLEL(a1,a2,a3,a4,a5): independent;

Sequential(b, Output('finished'));

//should take 1 second and then output 'finished'
