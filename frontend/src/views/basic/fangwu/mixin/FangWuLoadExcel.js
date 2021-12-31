import Const from '../../../../utils/const';
import Strings from "@/utils/strings";
import * as Proto from '../../../../utils/Proto';
import * as Tool from '../../../../utils';

export default {
  methods: {

    parseExcel(table) {
      const {header, results} = table;
      return new Promise((resolve, reject) => {
        if (!header || !results)
          return resolve([]);

        const headerType = {
          '楼栋名称': 'LDMC',
          '建筑结构': 'JZJG',
          '单元名称':'DYMC',
          '楼层': 'LC',
          '室号': 'SH',
          '房屋地址': 'FWDZ',
          '建筑面积': 'JZMJ',
          '房屋用途': 'FWYT',
          '房屋类型': 'FWLX',
          '购房总额': 'GFJE',

          '公房单位': 'GFDW',
          '业主姓名': 'YZXM',
          '证件号码': 'ZJHM',
          '手机号码': 'SJHM',
        }
        let data = {
          loudong: [],
          rows: [],
        };
        let loudongId = 0;
        for (let i = 0; i< results.length; i++) {
          let row = results[i];
          row = Tool.convertObjectKeys(row, headerType);
          const keys = Object.keys(row);
          keys.map((key) => {
            if (Tool.isValidString(row[key]))
              row[key] = row[key].trim();

            if (key == 'JZJG')
              row[key] = Tool.getKeyByValue(Strings.LOUDONG_JZJG, row[key]);
            if (key == 'DYMC')
              row[key] = row[key].replace('单元', '');
            if (key == 'LC')
              row[key] = row[key].replace('层', '');
            if (key == 'SH')
              row[key] = row[key].replace('室', '');
            if (key == 'FWYT')
              row[key] = Tool.getKeyByValue(Strings.FANGWU_YONGTU, row[key]);
            if (key == 'FWLX')
              row[key] = Tool.getKeyByValue(Strings.FANGWU_LEIXING, row[key]);
          })
          row.idx = i;
          if (!Tool.isValidString(row['LDMC'])) continue;
          let loudongIdx = Tool.getIndexByValue(data.loudong, item => item['LDMC']== row['LDMC']);
          if (loudongIdx == -1) {
            data.loudong.push(Tool.createObjectAndCopy(Proto.LOUDONG,{idx: loudongId, 'LDMC':row['LDMC'], new: true}));
            loudongId++;
            loudongIdx = data.loudong.length-1;
          }
          row.loudongIdx = data.loudong[loudongIdx].idx;
          data.rows.push(row);
        }
        return resolve(data);
      })
    }
  }
}
