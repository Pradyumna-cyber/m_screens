import 'package:flutter/material.dart';

class Department extends StatefulWidget {
  @override
  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  List<String> _departmentNames = [];
  TextEditingController _departmentNameController = TextEditingController();
  Color _departmentColor = Colors.grey;
  Color _locationColor = Colors.grey;
  Color _shiftsColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double paddingValue = screenWidth * 0.05;
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.1),
              child: Text(
                'Create',
                style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _departmentColor = Colors.blue;
                          _locationColor = Colors.grey;
                          _shiftsColor = Colors.grey;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(paddingValue),
                        child: Column(
                          children: [
                            SizedBox(height: screenHeight * 0.01),
                            Icon(
                              Icons.account_tree_outlined,
                              color: _departmentColor,
                            ),
                            Text('Department'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _departmentColor = Colors.grey;
                          _locationColor = Colors.blue;
                          _shiftsColor = Colors.grey;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(paddingValue),
                        child: Column(
                          children: [
                            SizedBox(height: screenHeight * 0.01),
                            Icon(
                              Icons.location_on_outlined,
                              color: _locationColor,
                            ),
                            Text('Location'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _departmentColor = Colors.grey;
                          _locationColor = Colors.grey;
                          _shiftsColor = Colors.blue;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(paddingValue),
                        child: Column(
                          children: [
                            SizedBox(height: screenHeight * 0.01),
                            Icon(
                              Icons.access_time_filled_rounded,
                              color: _shiftsColor,
                            ),
                            Text('Shifts'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.3),
                child: Text(
                  'List your Departments',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(paddingValue),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(screenHeight * 0.05),
                          ),
                          labelText: 'Department Name',
                        ),
                        controller: _departmentNameController,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            BorderRadius.circular(screenHeight * 0.05),
                      ),
                      child: IconButton(
                        onPressed: () {
                          if (_departmentNameController.text.isNotEmpty) {
                            setState(() {
                              _departmentNames
                                  .add(_departmentNameController.text);
                              _departmentNameController.clear();
                            });
                          }
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Wrap(
                children: _departmentNames
                    .map(
                      (departmentName) => SizedBox(
                        width: screenWidth / 2 - paddingValue * 2,
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: paddingValue),
                          padding: EdgeInsets.all(paddingValue),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(screenHeight * 0.05),
                            color: Colors.grey[200],
                          ),
                          child: Row(
                            children: [
                              Text(
                                departmentName,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _departmentNames.remove(departmentName);
                                  });
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
