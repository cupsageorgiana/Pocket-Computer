Proiectul presupune implementarea unui calculator de buzunar cu operațiile fundamentale (adunare, scădere, înmulțire, împărțire) în limbaj VHDL și testarea functionalității acestuia pe plăcuța cu FPGA. Ideea de bază pentru proiect este stabilirea condițiilor de funcționare a acestuia, precum modul de introducere a numerelor, modul de introducere a operațiilor, dar și realizarea operațiilor fundamentale folosind algoritmi proprii.

Operațiile de adunare și scădere sunt efectuate prin algoritmi care compara termenii și realizează operațiile în funcție de semnul fiecărui operand (cazurile în care unul este mai mare decât celălalt, unul dintre ei este pozitiv sau negativ sau ambii sunt negativi sau pozitivi).

Operațiile de înmultire și împărțire sunt efectuate cu ajutorul unor algoritmi specifici. Înmulțirea este realizată printr-un algoritm care presupune înmulțirea biților, rezultatul final fiind suma produselor parțiale obținute. Împărțirea este efectuată cu ajutorul scăderilor repetate în interiorul unei instrucțiuni repetitive cu ajutorul unui contor.

