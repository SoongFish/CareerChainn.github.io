pragma solidity ^0.4.22;

contract CareerChain
{
    struct info
    {
        string idnum; // identification numberr
        string name; // name of user
        string college; // name of college
        string GPA; // GPA
        string volunteer; // volunteer hours
        string certificate; // certificate information
        string writer; // name of writer
    }
    info[] public info_list;
    
    function Add_info(string _idnum, string _name, string _college, string _GPA, string _volunteer, string _certificate, string _writer) public
    {
        info_list.push(info(
        {
			idnum: _idnum,
            name: _name,
            college: _college,
            GPA: _GPA,
            volunteer: _volunteer,
            certificate: _certificate,
            writer: _writer
        }));
    }
    
    function Get_info(uint _order) public constant returns (string idnum, string name, string college, string GPA, string volunteer, string certificate, string writer)
    {
        return (info_list[_order].idnum, info_list[_order].name, info_list[_order].college, info_list[_order].GPA, info_list[_order].volunteer, info_list[_order].certificate, info_list[_order].writer);
    }
    
    function Search(string _idnum, string _name) public constant returns (string idnum, string name, string college, string GPA, string volunteer, string certificate, string writer)
    {
        for (uint i = 0; i < info_list.length; i++)
        {
            if (CompareStrings(info_list[i].idnum, _idnum) && CompareStrings(info_list[i].name, _name))
            {
                break;
            }
        }
        return (info_list[i].idnum, info_list[i].name, info_list[i].college, info_list[i].GPA, info_list[i].volunteer, info_list[i].certificate, info_list[i].writer);
    }
    
    function CompareStrings(string _a, string _b) pure public returns (bool)
    {
        return keccak256(_a) == keccak256(_b);
    }
}