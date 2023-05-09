// Temperature Converter App through Java in Android Studio
/* Name: Aman Ajay Challirwar
   Task 2: Temperature Converter App
 */package com.example.temp_convert;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    private EditText inputTemperature;
    private TextView outputTemperature;
    private Button convertButton;
    private RadioGroup temperatureRadioGroup;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        inputTemperature = findViewById(R.id.inputTemperature);
        outputTemperature = findViewById(R.id.outputTemperature);
        convertButton = findViewById(R.id.convertButton);
        temperatureRadioGroup = findViewById(R.id.temperatureRadioGroup);

        convertButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String temperatureString = inputTemperature.getText().toString();
                if (!temperatureString.isEmpty()) {
                    double temperature = Double.parseDouble(temperatureString);
                    if (isFahrenheitToCelsius()) {
                        double celsius = (temperature - 32) * 5/9;
                        outputTemperature.setText(String.format("%.2f", celsius) + " \u2103");
                    } else {
                        double fahrenheit = temperature * 9/5 + 32;
                        outputTemperature.setText(String.format("%.2f", fahrenheit) + " \u2109");
                    }
                } else {
                    outputTemperature.setText("");
                }
            }
        });
    }

    private boolean isFahrenheitToCelsius() {
        RadioButton fahrenheitToCelsiusRadioButton = findViewById(R.id.fahrenheitToCelsiusRadioButton);
        return fahrenheitToCelsiusRadioButton.isChecked();
    }
}
