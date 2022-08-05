// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;
contract todo 
{
    address owner;

    struct Task {
        string task;
        bool isDone;
    }

    mapping (address => Task[]) private Users;

    function addTask(string memory _task) public {

        Task memory task =  Task(_task,false);

        Users[msg.sender].push(task);

    }

    function getTask(uint _taskIndex) public view returns (Task memory) {
        Task memory task = Users[msg.sender][_taskIndex];
        return task;
    }

    function update(uint _taskIndex, bool _status) public {
        Users[msg.sender][_taskIndex].isDone = _status;
    }

    function deleteTask(uint _taskIndex) public {
        delete Users[msg.sender][_taskIndex];
    }

}