/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testcase;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

/**
 *
 * @author Admin
 */
public class CaseLogin {
    
    public static WebDriver driver = null;

    public static void main(String[] args) throws InterruptedException {
        // set Chrome driver
        System.setProperty("webdriver.chrome.driver", "test/driver/chromedriver_win32/chromedriver.exe");
        driver = new ChromeDriver();
        driver.manage().timeouts().implicitlyWait(15, TimeUnit.SECONDS);

        // open the web app
        driver.navigate().to("http://localhost:8084/Capstone_Final/HomeControl");
        driver.manage().window().maximize();
        
        // login
        driver.findElement(By.cssSelector("#header > div > ul > a:nth-child(2)")).click();
        Thread.sleep(2000);
        WebElement mailInput = driver.findElement(By.cssSelector("body > section > div > div:nth-child(2) > div > div > form > div:nth-child(1) > input"));
        mailInput.sendKeys("user@gmail.com");
        WebElement passInput = driver.findElement(By.cssSelector("#password-field"));
        passInput.sendKeys("1234");
        passInput.sendKeys(Keys.ENTER);
    }
    
}
