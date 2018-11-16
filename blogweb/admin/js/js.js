Function.prototype.method = function (name, func) {
  this.prototype[name] = func;
  return this;
};
if (!String.prototype.trim) {
  String.method('trim', function () {
    return this.replace(/^\s+|\s+$/g, '');
  });
  String.method('ltrim', function () {
    return this.replace(/^\s+/g, '');
  });
  String.method('rtrim', function () {
    return this.replace(/\s+$/g, '');
  });
}

function showHide(obj) {
  obj.style.display = obj.style.display == "none" ? "block" : "none";
}

function showtable(tablename) {
  var color1 = "#ffebcd";
  var color2 = "#fffaf0";
  var bgColor = "#fff8dc";
  var trs = document.getElementById(tablename).getElementsByTagName("tr");
  for (var i = 0; i < trs.length; i++) {
    if (i % 2 == 0) {
      trs[i].style.backgroundColor = color1;
      trs[i].onmouseover = function () {
        this.style.backgroundColor = bgColor;
      }
      trs[i].onmouseout = function () {
        this.style.backgroundColor = color1;
      }
    } else {
      trs[i].style.backgroundColor = color2;
      trs[i].onmouseover = function () {
        this.style.backgroundColor = bgColor;
      }
      trs[i].onmouseout = function () {
        this.style.backgroundColor = color2;
      }
    }
  }
}

function randomString(len) {����
  len = len || 32;����
  var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678'; /****Ĭ��ȥ�������׻������ַ�oOLl,9gq,Vv,Uu,I1****/ ����
  var maxPos = $chars.length;����
  var pwd = '';����
  for (i = 0; i < len; i++) {��������
    pwd += $chars.charAt(Math.floor(Math.random() * maxPos));����
  }����
  return pwd;
}

function Confirmmsg(frm) {
  if (confirm("ȷ��ɾ��ô��")) {
    frm.action.value = "del";
    frm.submit();
    return false;
  } else {
    return false;
  }
}

function check_site(frm) {
frm.submit1.disabled="true"
  if (frm.htmlurl.value.trim() == "") {
    alert("�Զ��徲̬ҳ��洢��·������Ϊ�գ������롣");
    frm.htmlurl.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  frm.submit();
frm.submit1.disabled=0
  return false;
}

function check_self_admin(frm) {
  frm.submit1.disabled = "true";
  if (frm.passwd1.value.trim() == "") {
    alert("�����벻��Ϊ�գ������롣");
    frm.passwd1.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  if (frm.passwd21.value.trim() != frm.passwd22.value.trim()) {
    alert("���벻�޸������ա�\n�����������벻ͬ�����������롣");
    frm.passwd21.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  frm.submit();
frm.submit1.disabled=0
  return false;
}

function check_add_admin(frm) {
  	frm.submit1.disabled="true"
  if (frm.adminname.value.trim() == "") {
    alert("��¼������Ϊ�գ������롣");
    frm.adminname.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  if (frm.passwd1.value.trim() == "") {
    alert("���벻��Ϊ�գ������롣");
    frm.passwd1.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  if (frm.passwd1.value.trim() != frm.passwd2.value.trim()) {
    alert("�����������벻ͬ�����������롣");
    frm.passwd1.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  var flag = 0;
  for (var i = 0; i < frm.isfree.length; i++)
    if (frm.isfree[i].checked == true) {
      flag = 1;
      break;
    }
  if (flag == 0) {
    alert("�Ƿ�ⶳ����Ϊ�գ���ѡ��");
    frm.isfree.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  var flag = 0;
  for (var i = 0; i < frm.ctrllimit.length; i++)
    if (frm.ctrllimit[i].checked == true) {
      flag = 1;
      break;
    }
  if (flag == 0) {
    alert("����Ȩ�޲���Ϊ�գ���ѡ��");
    frm.ctrllimit.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  var j = 0;
  for (var i = 0; i < frm.limitidrange.length; i++) {
    if (frm.limitidrange[i].checked) {
      j++;
    }
  }
  if (j == 0) {
    alert("Ȩ�޷�Χ����Ϊ�գ���ѡ��");
    frm.limitidrange[0].focus();
    frm.submit1.disabled = 0;
    return false;
  }
  frm.submit();
  frm.submit1.disabled = 0;
  return false;
}

function check_add_ads(frm) {
  	frm.submit1.disabled="true"
	if (typeof(frm.orderid)!="undefined"){
  var patrn = /^\+?[1-9][0-9]*$/;
  if (!patrn.test(frm.orderid.value.trim())) {
    //		if(frm.orderid.value.trim())
    alert("����Ϊ����0��������������");
    frm.orderid.focus();
    frm.submit1.disabled = 0;
    return false;
  }
	}
  if (frm.title.value.trim() == "") {
    alert("������Ʋ���Ϊ�գ������롣");
    frm.title.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  if (frm.content.value.trim() == "") {
    alert("�����벻��Ϊ�գ������롣");
    frm.content.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  frm.submit();
  frm.submit1.disabled = 0;
  return false;
}

function check_add_link(frm) {
  	frm.submit1.disabled="true"
	if (typeof(frm.orderid)!="undefined"){
  var patrn = /^\+?[1-9][0-9]*$/;
  if (!patrn.test(frm.orderid.value.trim())) {
    //		if(frm.orderid.value.trim())
    alert("����Ϊ����0��������������");
    frm.orderid.focus();
    frm.submit1.disabled = 0;
    return false;
  }
	}
	if (frm.title.value.trim() == "") {
    alert("�������Ʋ���Ϊ�գ������롣");
    frm.title.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  if (frm.homepage.value.trim() == "") {
    alert("���ӵ�ַ����Ϊ�գ������롣");
    frm.homepage.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  frm.submit();
  frm.submit1.disabled = 0;
  return false;
}

function check_add_article(frm) {
  	frm.submit1.disabled="true"
  if (frm.title.value.trim() == "") {
    alert("���ⲻ��Ϊ�գ������롣");
    frm.title.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  if (frm.columnid.value.trim() == "") {
    alert("������Ŀ����Ϊ�գ���ѡ��");
    frm.columnid.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  if (frm.isimgtext.checked) {
    if (frm.picfiles.value.trim() == "") {
      alert("���ѹ�ѡ���ͼ�Ĺ���,�������ϴ�����ͼƬ��");
      frm.picfiles.focus();
      frm.submit1.disabled = 0;
      return false;
    }
  }
  if (frm.isrollimg.checked) {
    if (frm.picfiles.value.trim() == "") {
      alert("���ѹ�ѡ����ͼƬ����,�������ϴ�����ͼƬ��");
      frm.picfiles.focus();
      frm.submit1.disabled = 0;
      return false;
    }
  }
  if (frm.isfocus.checked) {
    if (frm.picfiles.value.trim() == "") {
      alert("���ѹ�ѡ����ͼ����,�������ϴ�����ͼƬ��");
      frm.picfiles.focus();
      frm.submit1.disabled = 0;
      return false;
    }
  }
  frm.submit();
frm.submit1.disabled=0
  return false;
}

function check_add_column(frm) {
  	frm.submit1.disabled="true"
	if (typeof(frm.orderid)!="undefined"){
  var patrn = /^\+?[1-9][0-9]*$/;
  if (!patrn.test(frm.orderid.value.trim())) {
    alert("����Ϊ����0��������������");
    frm.orderid.focus();
    frm.submit1.disabled = 0;
    return false;
  }
	}
	if (frm.colname.value.trim() == "") {
    alert("��Ŀ���Ʋ���Ϊ�գ������롣");
    frm.colname.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  if (!patrn.test(frm.tpagesize.value.trim())) {
    alert("ÿҳ����Ϊ����0��������������");
    frm.tpagesize.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  frm.submit();
  frm.submit1.disabled = 0;
  return false;
}

function check_add_ulev(frm) {
  	frm.submit1.disabled="true"
  if (frm.levname.value.trim() == "") {
    alert("�ȼ����Ʋ���Ϊ�գ������롣");
    frm.levname.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  var patrn = /^\d{1,}$/;
  if (!patrn.test(frm.userjf.value.trim())) {
    //		if(frm.username.value.trim())
    alert("�ȼ�����Ϊ��������������");
    frm.userjf.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  frm.submit();
  frm.submit1.disabled = 0;
  return false;
}

function check_add_keys(frm) {
  	frm.submit1.disabled="true"
  if (frm.keys.value.trim() == "") {
    alert("ע���벻��Ϊ�գ������롣");
    frm.keys.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  frm.submit();
  frm.submit1.disabled = 0;
  return false;
}

function check_dbbackup(frm) {
  frm.submit1.disabled = "true";
  if (confirm("ȷ���������ݿ�ô��")) {} else {
    frm.submit1.disabled = 0;
    return false;
  }
  var patrn = /^\d{15,}\.+asp$/;
  if (!patrn.test(frm.db_backupname.value.trim())) {
    alert("�������ݿ�����Ϊ���������Զ����ɵģ���ˢ��ҳ���ϵͳ���Զ�����������");
    frm.db_backupname.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  if (frm.action.value.trim() != "backup") {
    alert("ҳ����ִ����������������棬Ȼ��ˢ������������������");
    frm.submit1.disabled = 0;
    return false;
  }
  frm.submit();
frm.submit1.disabled=0
  return false;
}

function check_dbrestore(frm) {
  frm.submit2.disabled = "true";
  if (frm.restore_file.value.trim() == "") {
    alert("��ѡ��1����Ҫ��ԭ�����ݿ��ļ���");
    frm.restore_file.focus();
    frm.submit2.disabled = 0;
    return false;
  }
  if (frm.action.value.trim() != "restore") {
    alert("ҳ����ִ����������������棬Ȼ��ˢ������������������");
    frm.submit2.disabled = 0;
    return false;
  }
  if (confirm("��ԭ���ݿ�ǰ�뱸���������ݿ⡣\n��ԭ���ݿ�Ḳ���������ݿ⣬ȷ����ԭô��")) {
    frm.submit();
frm.submit2.disabled=0
    return false;
  } else {
    frm.submit2.disabled = 0;
    return false;
  }
}

function check_edit_admin(frm) {
  frm.submit1.disabled = "true";
  if (frm.adminname.value.trim() == "") {
    alert("��¼������Ϊ�գ������롣");
    frm.adminname.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  if (frm.passwd1.value.trim() != frm.passwd2.value.trim()) {
    alert("���벻�޸������ա�\n�����������벻ͬ�����������롣");
    frm.passwd1.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  var flag = 0;
  for (var i = 0; i < frm.isfree.length; i++)
    if (frm.isfree[i].checked == true) {
      flag = 1;
      break;
    }
  if (flag == 0) {
    alert("�Ƿ�ⶳ����Ϊ�գ���ѡ��");
    frm.isfree.focus();
    frm.submit1.disabled = 0
    return false;
  }
  var flag = 0;
  for (var i = 0; i < frm.ctrllimit.length; i++)
    if (frm.ctrllimit[i].checked == true) {
      flag = 1
      break
    }
  if (flag == 0) {
    alert("����Ȩ�޲���Ϊ�գ���ѡ��")
    frm.ctrllimit.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  var j = 0;
  for (var i = 0; i < frm.limitidrange.length; i++) {
    if (frm.limitidrange[i].checked) {
      j++;
    }
  }
  if (j == 0) {
    alert("Ȩ�޷�Χ����Ϊ�գ���ѡ��")
    frm.limitidrange[0].focus();
    frm.submit1.disabled = 0;
    return false;
  }
  frm.submit();
  frm.submit1.disabled = 0;
  return false;
}

function trcopy(obj) {
  obj.select();
  js = obj.createTextRange();
  js.execCommand("Copy");
  alert("���Ƴɹ���");
}

function checkAll() {
    //�����в���ѡ���checkboxʹ����ͬ��name������Ϊ"num_iid"
    var eles = document.getElementsByName("id");
    var i = 0;
    // �����ȫѡ״̬����ȡ�����е�ѡ��
    if (isSelectAll() == true) {
      for (i = 0; i < eles.length; i++) {
        eles[i].checked = false;
      }
      document.getElementById("selectall").checked = false;
      document.getElementById("selectall2").checked = false;
    } else {
      // ����ѡ��ÿһ��checkbox
      for (i = 0; i < eles.length; i++) {
        eles[i].checked = true;
      }
      document.getElementById("selectall").checked = true;
      document.getElementById("selectall2").checked = true;
    }
  }

function isSelectAll() {
    var isSelected = true;
    var eles = document.getElementsByName("id");
    for (var i = 0; i < eles.length; i++) {
      if (eles[i].checked != true) {
        isSelected = false;
      }
    }
    return isSelected;
  }

function checkOne(id) {
  if (isSelectAll()) {
    document.getElementById("selectall").checked = true;
    document.getElementById("selectall2").checked = true;
  } else {
    document.getElementById("selectall").checked = false;
    document.getElementById("selectall2").checked = false;
  }
  if (document.getElementById(id).checked == true) {
    document.getElementById(id).checked = false;
  } else {
    document.getElementById(id).checked = true;
  }
}

function checkchose(frm) {
  frm.submit1.disabled = true;
  var j = 0;
  var ids = document.getElementsByName("id");
  var flag = false;
  for (var i = 0; i < ids.length; i++) {
    if (ids[i].checked) {
      flag = true;
      break;
    }
  }
  if (!flag) {
    alert("��ѡ��Ҫ��������Ŀ��");
  frm.submit1.disabled = 0;
    return false;
  }
  if (confirm("ȷ������ô��")) {
    frm.submit();
frm.submit1.disabled=0
    return false;
  } else {
  frm.submit1.disabled = 0;
    return false;
  }
}

function del_tr(trid, url, sname) {
  if (confirm("ȷ��ɾ��ô��")) {
    window.open(url, sname);
    document.getElementById(trid).style.display = "none";
  } else {
    return false;
  }
}

function acdel(frm, trid) {
  if (confirm("ȷ��ɾ��ô��")) {
    document.getElementById(trid).style.display = "none";
    frm.action.value = "del";
    frm.submit();
    return false;
  } else {
    return false;
  }
}

function acdodel(frm, trid) {
  if (confirm("ȷ������ɾ��ô��")) {
    document.getElementById(trid).style.display = "none";
    frm.action.value = "dodel";
    frm.submit();
    return false;
  } else {
    return false;
  }
}

function checkadminadduser(frm) {
  frm.submit1.disabled = "true";
  var patrn = /^[\w+$]{5,20}$/;
  if (!patrn.test(frm.username.value.trim())) {
    alert("��¼��Ϊ5-20���ַ����������뺺�֣�ֻ�ɰ������֣���ĸ���»���");
    frm.username.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  if (!patrn.test(frm.passwd1.value.trim())) {
    alert("����Ϊ5-20���ַ����������뺺�֣�ֻ�ɰ������֣���ĸ���»���");
    frm.passwd1.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  if (frm.passwd1.value != frm.passwd2.value) {
    alert("�����������벻ͬ������������");
    frm.passwd1.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  mail = frm.mail.value.trim();
  if (mail.indexOf("55tr.com") > -1) {
    alert("��������ʵ������,����ʹ��55tr.com");
    frm.mail.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  re = new RegExp("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$");
  if (!re.test(mail)) {
    alert("��������ȷ������,���� admin@55tr.com");
    frm.mail.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  frm.submit();
frm.submit1.disabled=0
  return false;
}

function checkadminedituser(frm) {
  frm.submit1.disabled = "true";
  var patrn = /^[\w+$]{5,20}$/;
  if (frm.passwd1.value.trim() != "") {
    if (!patrn.test(frm.passwd1.value.trim())) {
      alert("����Ϊ5-20���ַ����������뺺�֣�ֻ�ɰ������֣���ĸ���»���");
      frm.passwd1.focus();
    frm.submit1.disabled = 0;
      return false;
    }
    if (frm.passwd1.value != frm.passwd2.value) {
      alert("�����������벻ͬ�����������룬���޸�������")
      frm.passwd1.focus();
    frm.submit1.disabled = 0;
      return false;
    }
  }
  mail = frm.mail.value.trim();
  if (mail.indexOf("55tr.com") > -1) {
    alert("��������ʵ������,����ʹ��55tr.com");
    frm.mail.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  re = new RegExp("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$");
  if (!re.test(mail)) {
    alert("��������ȷ������,���� admin@55tr.com");
    frm.mail.focus();
    frm.submit1.disabled = 0;
    return false;
  }
  frm.submit();
frm.submit1.disabled=0
  return false;
}

function checkcheckbox(id, name) {
  var boxes = document.getElementsByName(name);
  for (i = 0; i < boxes.length; i++) {
    boxes[i].checked = false;
  }
  document.getElementById(id).checked = true;
}

function confirms() {
  if (confirm("ȷ����������ô��")) {} else {
    return false;
  }
}

