using ZMARAVW01 from '../db/external-model';

//using YEXCUSTVW from '../db/external_vt'; //customer name

service vtcat {
    @readonly entity ZMARAVW01_SVR as projection on ZMARAVW01;
}    