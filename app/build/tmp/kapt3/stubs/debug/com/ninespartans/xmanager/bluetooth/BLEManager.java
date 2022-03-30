package com.ninespartans.xmanager.bluetooth;

import java.lang.System;

@kotlin.Metadata(mv = {1, 5, 1}, k = 1, d1 = {"\u0000\u0094\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\t\n\u0002\b\u000e\n\u0002\u0010\u0012\n\u0002\b\u0002\b\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002\u00a2\u0006\u0002\u0010\u0002J\u000e\u0010O\u001a\u00020\u000e2\u0006\u0010P\u001a\u00020QJ\u000e\u0010R\u001a\u00020\u000e2\u0006\u0010P\u001a\u00020QJ\u0006\u0010S\u001a\u00020\u000eJ\u000e\u0010T\u001a\u00020\u000e2\u0006\u0010P\u001a\u00020QJ\u0006\u0010U\u001a\u00020\u0019J\u000e\u0010V\u001a\u00020\u000e2\u0006\u0010P\u001a\u00020QJ\u000e\u0010W\u001a\u00020\u00192\u0006\u0010P\u001a\u00020QJ\u0006\u0010X\u001a\u00020\u000eJ\u0006\u0010Y\u001a\u00020\u000eJ\u0006\u0010Z\u001a\u00020\u0019J\"\u0010[\u001a\u00020\u00192\u0010\b\u0002\u0010\\\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u0001052\b\b\u0002\u0010]\u001a\u00020^J\u0006\u0010_\u001a\u00020\u0019J\u000e\u0010`\u001a\u00020\u000e2\u0006\u0010P\u001a\u00020QJ\u000e\u0010a\u001a\u00020\u00192\u0006\u0010b\u001a\u00020\u0004J\u000e\u0010c\u001a\u00020\u000e2\u0006\u0010P\u001a\u00020QJ\u0016\u0010d\u001a\u00020\u000e2\u0006\u0010e\u001a\u00020\u00042\u0006\u0010P\u001a\u00020QJ\u000e\u0010f\u001a\u00020\u00192\u0006\u0010g\u001a\u00020\u0018J\u0010\u0010h\u001a\u00020\u00192\b\b\u0002\u0010i\u001a\u00020^J\u0006\u0010j\u001a\u00020\u0019J\u000e\u0010k\u001a\u00020\u00192\u0006\u0010l\u001a\u00020mJ\u000e\u0010k\u001a\u00020\u00192\u0006\u0010n\u001a\u00020\u0004R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0082T\u00a2\u0006\u0002\n\u0000R\u001e\u0010\u0007\u001a\u0004\u0018\u00010\b8FX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\t\u0010\n\"\u0004\b\u000b\u0010\fR\u001c\u0010\r\u001a\u00020\u000e8FX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u000f\u0010\u0010\"\u0004\b\u0011\u0010\u0012R\u000e\u0010\u0013\u001a\u00020\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0015X\u0082\u000e\u00a2\u0006\u0002\n\u0000R&\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u0018\u0012\u0004\u0012\u00020\u00190\u0017X\u0086.\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001a\u0010\u001b\"\u0004\b\u001c\u0010\u001dR*\u0010\u001e\u001a\u0012\u0012\u0006\u0012\u0004\u0018\u00010\u001f\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0017X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b \u0010\u001b\"\u0004\b!\u0010\u001dR*\u0010\"\u001a\u0012\u0012\u0006\u0012\u0004\u0018\u00010\u001f\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0017X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b#\u0010\u001b\"\u0004\b$\u0010\u001dRa\u0010%\u001aI\u0012\u0013\u0012\u00110\u0015\u00a2\u0006\f\b\'\u0012\b\b(\u0012\u0004\b\b()\u0012\u0013\u0012\u00110*\u00a2\u0006\f\b\'\u0012\b\b(\u0012\u0004\b\b(+\u0012\u0013\u0012\u00110*\u00a2\u0006\f\b\'\u0012\b\b(\u0012\u0004\b\b(,\u0012\u0004\u0012\u00020\u0019\u0018\u00010&X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b-\u0010.\"\u0004\b/\u00100R(\u00101\u001a\u0010\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0017X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b2\u0010\u001b\"\u0004\b3\u0010\u001dR \u00104\u001a\b\u0012\u0004\u0012\u00020\u001905X\u0086.\u00a2\u0006\u000e\n\u0000\u001a\u0004\b6\u00107\"\u0004\b8\u00109R \u0010:\u001a\b\u0012\u0004\u0012\u00020\u001905X\u0086.\u00a2\u0006\u000e\n\u0000\u001a\u0004\b;\u00107\"\u0004\b<\u00109R\u000e\u0010=\u001a\u00020\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010>\u001a\u00020?X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010@\u001a\u00020AX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\bB\u0010C\"\u0004\bD\u0010ER\u001a\u0010F\u001a\u00020\u000eX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\bG\u0010\u0010\"\u0004\bH\u0010\u0012R\u000e\u0010I\u001a\u00020\u001fX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010J\u001a\u00020KX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010L\u001a\u00020\u0018X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010M\u001a\u00020NX\u0082.\u00a2\u0006\u0002\n\u0000\u00a8\u0006o"}, d2 = {"Lcom/ninespartans/xmanager/bluetooth/BLEManager;", "", "()V", "GENERAL_CHARACTERISTIC", "", "GENERAL_DESCRIPTOR", "GENERAL_SERVICE", "adapter", "Landroid/bluetooth/BluetoothAdapter;", "getAdapter", "()Landroid/bluetooth/BluetoothAdapter;", "setAdapter", "(Landroid/bluetooth/BluetoothAdapter;)V", "adapterEnabled", "", "getAdapterEnabled", "()Z", "setAdapterEnabled", "(Z)V", "bleConnected", "bluetoothGatt", "Landroid/bluetooth/BluetoothGatt;", "didFoundDevice", "Lkotlin/Function1;", "Landroid/bluetooth/BluetoothDevice;", "", "getDidFoundDevice", "()Lkotlin/jvm/functions/Function1;", "setDidFoundDevice", "(Lkotlin/jvm/functions/Function1;)V", "onCharacteristicRead", "Landroid/bluetooth/BluetoothGattCharacteristic;", "getOnCharacteristicRead", "setOnCharacteristicRead", "onCharacteristicWrite", "getOnCharacteristicWrite", "setOnCharacteristicWrite", "onConnectionStateChange", "Lkotlin/Function3;", "Lkotlin/ParameterName;", "name", "bleGatt", "", "status", "newState", "getOnConnectionStateChange", "()Lkotlin/jvm/functions/Function3;", "setOnConnectionStateChange", "(Lkotlin/jvm/functions/Function3;)V", "onServiceDiscovered", "getOnServiceDiscovered", "setOnServiceDiscovered", "onStartScanning", "Lkotlin/Function0;", "getOnStartScanning", "()Lkotlin/jvm/functions/Function0;", "setOnStartScanning", "(Lkotlin/jvm/functions/Function0;)V", "onStopScanning", "getOnStopScanning", "setOnStopScanning", "reading", "scanCallBack", "Landroid/bluetooth/le/ScanCallback;", "scanner", "Landroid/bluetooth/le/BluetoothLeScanner;", "getScanner", "()Landroid/bluetooth/le/BluetoothLeScanner;", "setScanner", "(Landroid/bluetooth/le/BluetoothLeScanner;)V", "scanning", "getScanning", "setScanning", "selectedCharacteristic", "selectedDescriptor", "Landroid/bluetooth/BluetoothGattDescriptor;", "selectedDevice", "selectedService", "Landroid/bluetooth/BluetoothGattService;", "bleAdminGranted", "context", "Landroid/content/Context;", "bleGranted", "bleIsEnabled", "canStart", "close", "coarseLocationGranted", "connectDevice", "connected", "deviceConnected", "disableReading", "disconnectDevice", "completion", "after", "", "enableReading", "fineLocationGranted", "getDevice", "address", "gpsEnabled", "isPermissionGranted", "permission", "selectDevice", "device", "startScanning", "stopAfter", "stopScanning", "write", "byteArray", "", "string", "app_debug"})
public final class BLEManager {
    @org.jetbrains.annotations.NotNull()
    public static final com.ninespartans.xmanager.bluetooth.BLEManager INSTANCE = null;
    private static final java.lang.String GENERAL_SERVICE = "a327169a-31c0-4010-aebf-3e68ee255144";
    private static final java.lang.String GENERAL_CHARACTERISTIC = "e8e0d1f9-d24d-41b8-9a81-38be02772944";
    private static final java.lang.String GENERAL_DESCRIPTOR = "29976087-4812-4e67-8624-67d10df59231";
    public static kotlin.jvm.functions.Function1<? super android.bluetooth.BluetoothDevice, kotlin.Unit> didFoundDevice;
    public static kotlin.jvm.functions.Function0<kotlin.Unit> onStartScanning;
    public static kotlin.jvm.functions.Function0<kotlin.Unit> onStopScanning;
    @org.jetbrains.annotations.Nullable()
    private static kotlin.jvm.functions.Function3<? super android.bluetooth.BluetoothGatt, ? super java.lang.Integer, ? super java.lang.Integer, kotlin.Unit> onConnectionStateChange;
    @org.jetbrains.annotations.Nullable()
    private static kotlin.jvm.functions.Function1<? super java.lang.Boolean, kotlin.Unit> onServiceDiscovered;
    @org.jetbrains.annotations.Nullable()
    private static kotlin.jvm.functions.Function1<? super android.bluetooth.BluetoothGattCharacteristic, kotlin.Unit> onCharacteristicRead;
    @org.jetbrains.annotations.Nullable()
    private static kotlin.jvm.functions.Function1<? super android.bluetooth.BluetoothGattCharacteristic, kotlin.Unit> onCharacteristicWrite;
    private static boolean scanning = false;
    private static android.bluetooth.BluetoothDevice selectedDevice;
    private static boolean bleConnected = false;
    private static android.bluetooth.BluetoothGatt bluetoothGatt;
    private static android.bluetooth.BluetoothGattService selectedService;
    private static android.bluetooth.BluetoothGattCharacteristic selectedCharacteristic;
    private static android.bluetooth.BluetoothGattDescriptor selectedDescriptor;
    private static boolean reading = false;
    @org.jetbrains.annotations.Nullable()
    private static android.bluetooth.BluetoothAdapter adapter;
    private static boolean adapterEnabled = false;
    @org.jetbrains.annotations.NotNull()
    private static android.bluetooth.le.BluetoothLeScanner scanner;
    private static final android.bluetooth.le.ScanCallback scanCallBack = null;
    
    private BLEManager() {
        super();
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlin.jvm.functions.Function1<android.bluetooth.BluetoothDevice, kotlin.Unit> getDidFoundDevice() {
        return null;
    }
    
    public final void setDidFoundDevice(@org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function1<? super android.bluetooth.BluetoothDevice, kotlin.Unit> p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlin.jvm.functions.Function0<kotlin.Unit> getOnStartScanning() {
        return null;
    }
    
    public final void setOnStartScanning(@org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function0<kotlin.Unit> p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlin.jvm.functions.Function0<kotlin.Unit> getOnStopScanning() {
        return null;
    }
    
    public final void setOnStopScanning(@org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function0<kotlin.Unit> p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final kotlin.jvm.functions.Function3<android.bluetooth.BluetoothGatt, java.lang.Integer, java.lang.Integer, kotlin.Unit> getOnConnectionStateChange() {
        return null;
    }
    
    public final void setOnConnectionStateChange(@org.jetbrains.annotations.Nullable()
    kotlin.jvm.functions.Function3<? super android.bluetooth.BluetoothGatt, ? super java.lang.Integer, ? super java.lang.Integer, kotlin.Unit> p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final kotlin.jvm.functions.Function1<java.lang.Boolean, kotlin.Unit> getOnServiceDiscovered() {
        return null;
    }
    
    public final void setOnServiceDiscovered(@org.jetbrains.annotations.Nullable()
    kotlin.jvm.functions.Function1<? super java.lang.Boolean, kotlin.Unit> p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final kotlin.jvm.functions.Function1<android.bluetooth.BluetoothGattCharacteristic, kotlin.Unit> getOnCharacteristicRead() {
        return null;
    }
    
    public final void setOnCharacteristicRead(@org.jetbrains.annotations.Nullable()
    kotlin.jvm.functions.Function1<? super android.bluetooth.BluetoothGattCharacteristic, kotlin.Unit> p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final kotlin.jvm.functions.Function1<android.bluetooth.BluetoothGattCharacteristic, kotlin.Unit> getOnCharacteristicWrite() {
        return null;
    }
    
    public final void setOnCharacteristicWrite(@org.jetbrains.annotations.Nullable()
    kotlin.jvm.functions.Function1<? super android.bluetooth.BluetoothGattCharacteristic, kotlin.Unit> p0) {
    }
    
    public final boolean getScanning() {
        return false;
    }
    
    public final void setScanning(boolean p0) {
    }
    
    public final void setAdapter(@org.jetbrains.annotations.Nullable()
    android.bluetooth.BluetoothAdapter p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final android.bluetooth.BluetoothAdapter getAdapter() {
        return null;
    }
    
    public final void setAdapterEnabled(boolean p0) {
    }
    
    public final boolean getAdapterEnabled() {
        return false;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final android.bluetooth.le.BluetoothLeScanner getScanner() {
        return null;
    }
    
    public final void setScanner(@org.jetbrains.annotations.NotNull()
    android.bluetooth.le.BluetoothLeScanner p0) {
    }
    
    /**
     * Scan for devices
     */
    public final void startScanning(long stopAfter) {
    }
    
    /**
     * Get Device by MAC
     */
    public final void getDevice(@org.jetbrains.annotations.NotNull()
    java.lang.String address) {
    }
    
    public final void stopScanning() {
    }
    
    /**
     * Select the device
     */
    public final void selectDevice(@org.jetbrains.annotations.NotNull()
    android.bluetooth.BluetoothDevice device) {
    }
    
    /**
     * Disconnect to Device
     * Callback handler when done
     */
    public final void disconnectDevice(@org.jetbrains.annotations.Nullable()
    kotlin.jvm.functions.Function0<kotlin.Unit> completion, long after) {
    }
    
    public final boolean connected() {
        return false;
    }
    
    /**
     * Connect to Device
     */
    public final void connectDevice(@org.jetbrains.annotations.NotNull()
    android.content.Context context) {
    }
    
    public final boolean deviceConnected() {
        return false;
    }
    
    public final void enableReading() {
    }
    
    public final void disableReading() {
    }
    
    public final void write(@org.jetbrains.annotations.NotNull()
    byte[] byteArray) {
    }
    
    public final void write(@org.jetbrains.annotations.NotNull()
    java.lang.String string) {
    }
    
    public final void close() {
    }
    
    /**
     * Util function
     * Function to check if some permission is granted
     */
    public final boolean isPermissionGranted(@org.jetbrains.annotations.NotNull()
    java.lang.String permission, @org.jetbrains.annotations.NotNull()
    android.content.Context context) {
        return false;
    }
    
    public final boolean bleGranted(@org.jetbrains.annotations.NotNull()
    android.content.Context context) {
        return false;
    }
    
    public final boolean bleAdminGranted(@org.jetbrains.annotations.NotNull()
    android.content.Context context) {
        return false;
    }
    
    public final boolean coarseLocationGranted(@org.jetbrains.annotations.NotNull()
    android.content.Context context) {
        return false;
    }
    
    public final boolean fineLocationGranted(@org.jetbrains.annotations.NotNull()
    android.content.Context context) {
        return false;
    }
    
    public final boolean bleIsEnabled() {
        return false;
    }
    
    public final boolean gpsEnabled(@org.jetbrains.annotations.NotNull()
    android.content.Context context) {
        return false;
    }
    
    public final boolean canStart(@org.jetbrains.annotations.NotNull()
    android.content.Context context) {
        return false;
    }
}