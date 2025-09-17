package vn.silver.Configs;

import jakarta.persistence.EntityManager;
import vn.silver.Configs.JPAConfig;

public class test {
	public static void main(String[] args) {
        EntityManager enma = JPAConfig.getEntityManager();
        enma.close(); // chỉ cần mở kết nối rồi đóng lại
    }
}