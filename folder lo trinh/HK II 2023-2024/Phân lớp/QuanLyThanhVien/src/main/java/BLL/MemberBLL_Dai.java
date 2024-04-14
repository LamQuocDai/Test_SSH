/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package BLL;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;
import javax.swing.JOptionPane;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import DAL.MemberDAL;

/**
 *
 * @author Admin
 */
public class MemberBLL_Dai {
    private MemberDAL memberDAL = new MemberDAL();

    public boolean importExcel(String path) {
        int cnt = 0;

        try {
            FileInputStream fis = new FileInputStream(path);

            Workbook workbook = getWorkBook(fis, path);
            if (workbook == null) {
                return false;
            }

            Sheet sheet = workbook.getSheetAt(0);

            Iterator<Row> iterator = sheet.iterator();
            while (iterator.hasNext()) {
                Row nextRow = iterator.next();
                if (nextRow.getRowNum() == 0) {
                    continue;
                }

                Member member = new Member();

                Iterator<Cell> cellIterator = nextRow.cellIterator();

                while (cellIterator.hasNext()) {
                    Cell cell = cellIterator.next();
                    Object cellValue = getCellValue(cell);

                    switch (cell.getColumnIndex()) {
                        case 0:
                            member.setId((Long.parseLong(cellValue.toString())));
                            break;
                        case 1:
                            member.setName(cellValue.toString());
                            break;
                        case 2:
                            member.setFaculty(cellValue.toString());
                            break;
                        case 3:
                            member.setField(cellValue.toString());
                            break;
                        case 4:
                            member.setPhoneNumber(cellValue.toString());
                            break;
                        default:
                            break;
                    }
                }
                
                System.out.println(member.toString());
                if (memberDAL.addMember(member) == 1) {
                    cnt++;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (cnt > 0) {
            JOptionPane.showMessageDialog(null, "Đã import " + cnt + "  thành viên");
            return true;
        } else {
            JOptionPane.showMessageDialog(null, "Import excel thất bại \nHãy kiểm tra lại thông tin các sản phẩm trong file",
                    "Lỗi", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }
        
         

    public Object getCellValue(Cell cell) {
        Object cellValue = null;
        CellType cellType = cell.getCellType();

        switch (cellType) {
            case STRING:
                cellValue = cell.getStringCellValue();
                break;
            case NUMERIC:
                DataFormatter dataFormatter = new DataFormatter();
                cellValue = dataFormatter.formatCellValue(cell);
                break;
            case _NONE:
            case BLANK:
                cellValue = "";
                break;
            default:
                break;
        }

        return cellValue;
    }

    public Workbook getWorkBook(FileInputStream fis, String path) throws IOException {
        Workbook workbook = null;

        if (path.endsWith("xlsx")) {
            workbook = new XSSFWorkbook(fis);
        } else if (path.endsWith("xls")) {
            workbook = new HSSFWorkbook(fis);
        } else {
            JOptionPane.showMessageDialog(null, "File excel không hợp lệ (.xlsx)", "Lỗi", JOptionPane.ERROR_MESSAGE);
        }

        return workbook;
    }
}
