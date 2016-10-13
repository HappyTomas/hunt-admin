organization_tool = {
    //重置表单
    form_reset: function () {
        $("#organization_form").form("reset");
    },
    //初始化数据
    init_data: function () {
        var data_json = '';
        $.ajax({
            method: 'post',
            url: '/organization/select',
            async: false,
            dataType: 'json',
            success: function (result) {
                if (result.code == 10000) {
                    data_json = result.data;
                    console.log(data_json);
                }
                else {
                    common_tool.messager_show(result.msg);
                }
            },
        });
        return data_json;
    },
    //校验参数
    checkValidatebox: function () {
        if (!$('#name').validatebox('isValid')) {
            common_tool.messager_show('请输入名称');
            return false;
        } else if (!$('#fullName').validatebox('isValid')) {
            common_tool.messager_show('请输入全称');
            return false;
        } else if (!$('#description').validatebox('isValid')) {
            common_tool.messager_show('请输入描述');
            return false;
        } else if ($("#organization_save_right").treegrid("getChecked").length == 0) {
            common_tool.messager_show('请选择上级组织机构');
            return false;
        }
        return true;
    },
    //初始化页面+加载数据
    init_mian_view: function () {
        $("#organization").treegrid({
            data: organization_tool.init_data(),
            idField: "id",
            nodeId: 'id',
            treeField: 'name',
            fitColumns: true,
            toolbar: '#tool-bar',
            rownumbers: true,
            animate: true,
            fit: true,
            border: false,
            pagePosition: "bottom",
            pageNumber: 1,
            pageSize: 15,
            pageList: [15, 30, 45, 60],
            pagination: false,
            striped: true,
            columns: [[
                {title: "选择", field: "ck", checkbox: true},
                {title: "简称", field: "name", width: 300},
                {title: "全称", field: "fullName", width: 300},
                {title: "说明", field: "description", width: 400},
                {
                    title: "是否可修改", field: "isFinal", formatter: function (value, row, index) {
                    if (value == 1) {
                        return "是";
                    }
                    if (value == 2) {
                        return "否";
                    }
                }, width: 60
                },
                {
                    title: "创建时间", field: "createTime", formatter: function (value, row, index) {
                    date = new Date(value);
                    timeStr = date.getFullYear() + "-" + date.getMonth() + "-" + date.getDay() + " " + date.getHours() + ":" + date.getMinutes();
                    return timeStr;
                }, width: 100
                },
                {
                    title: "更新时间", field: "updateTime", formatter: function (value, row, index) {
                    date = new Date(value);
                    timeStr = date.getFullYear() + "-" + date.getMonth() + "-" + date.getDay() + " " + date.getHours() + ":" + date.getMinutes();
                    return timeStr;
                }, width: 100
                },
            ]],
        });
    },
    init_edit_view: function (data, parentId) {
        console.log("init add");
        $("#organization_save").dialog({
            title: '新增组织机构',
            iconCls: 'icon-save',
            closable: true,
            width: 900,
            height: 400,
            cache: false,
            modal: true,
            resizable: false,
            'onOpen': function () {
                if (parentId == null) {
                    $("#organization_save_right").treegrid({
                        title: '上级组织机构',
                        data: organization_tool.init_data(),
                    });
                }
                if (parentId != null) {
                    $("#organization_save_right").treegrid({
                        title: '上级组织机构',
                        data: organization_tool.init_data(),
                    });
                    $("#organization_save_right").treegrid('select', parentId);
                }
            },
            'onClose': function () {
                organization_tool.form_reset();
            },
            buttons: [
                {
                    text: '保存',
                    width: 100,
                    iconCls: 'icon-save',
                    handler: function () {
                        if (data == 1) {
                            organization_tool.save();
                        }
                        if (data == 2) {
                            organization_tool.update();
                        }
                    }
                },
                {
                    text: '清除',
                    width: 100,
                    iconCls: 'icon-reload',
                    handler: function () {
                        organization_tool.form_reset();
                    }
                },
                {
                    text: '取消',
                    width: 100,
                    iconCls: 'icon-add',
                    handler: function () {
                        $("#organization_save").dialog('close');
                        organization_tool.form_reset();
                    }
                }
            ],
        });
    },
    delete: function (id) {
        $.ajax({
            data: {
                id: id,
            },
            method: 'get',
            url: '/organization/delete',
            async: false,
            dataType: 'json',
            success: function (result) {
                if (result.code == 10000) {
                    organization_tool.init_mian_view();
                }
                else {
                    common_tool.messager_show(result.msg);
                }
            },
        });
    },
    save: function () {
        if (!organization_tool.checkValidatebox()) {
            return false;
        }
        var name = $("#name").val();
        var fullName = $("#fullName").val();
        var description = $("#description").val();
        var isFinal = 1;
        var parentId = $("#organization_save_right").treegrid("getChecked")[0].id;
        $.ajax({
            data: {
                name: name,
                fullName: fullName,
                description: description,
                isFinal: isFinal,
                parentId: parentId,
            },
            method: 'post',
            url: '/organization/insert',
            async: false,
            dataType: 'json',
            success: function (result) {
                if (result.code == 10000) {
                    $("#organization_save").dialog("close");
                    organization_tool.form_reset();
                    organization_tool.init_mian_view();
                }
                else {
                    common_tool.messager_show(result.msg);
                }
            },
        });
    },
    update: function () {
        if (!organization_tool.checkValidatebox()) {
            return false;
        }
        var id = $("#id").val();
        var name = $("#name").val();
        var fullName = $("#fullName").val();
        var description = $("#description").val();
        var parentId = $("#organization_save_right").treegrid("getChecked")[0].id;
        $.ajax({
            data: {
                id: id,
                name: name,
                fullName: fullName,
                description: description,
                parentId: parentId,
            },
            method: 'post',
            url: '/organization/update',
            async: false,
            dataType: 'json',
            success: function (result) {
                if (result.code == 10000) {
                    $("#organization_save").dialog("close");
                    organization_tool.form_reset();
                    organization_tool.init_mian_view();
                }
                else {
                    common_tool.messager_show(result.msg);
                }
            },
        });
    }
};
$(document).ready(function () {
    organization_tool.init_mian_view();
    $(".save-btn").click(function () {
        organization_tool.init_edit_view(1, null);
    });
    $(".update-btn").click(function () {
        var organizationArray = $("#organization").treegrid('getChecked');
        if (organizationArray.length == 0) {
            common_tool.messager_show("请选择一条记录");
            return false;
        }
        organization_tool.init_edit_view(2, organizationArray[0].parentId);
        $("#organization_form").form('load', {
            "id": organizationArray[0].id,
            "name": organizationArray[0].name,
            "fullName": organizationArray[0].fullName,
            "description": organizationArray[0].description,
        })


    });
    $(".delete-btn").click(function () {
        var organizationArray = $("#organization").treegrid('getChecked');
        if (organizationArray.length == 0) {
            common_tool.messager_show("请至少选择一条记录");
            return false;
        }
        $.messager.confirm('确认对话框', "您确认删除该条记录吗?", function (r) {
            if (r) {
                organization_tool.delete(organizationArray[0].id);
            }
        });
    });
    $(".select-btn").click(function () {
        organization_tool.init_mian_view();
    });
});

