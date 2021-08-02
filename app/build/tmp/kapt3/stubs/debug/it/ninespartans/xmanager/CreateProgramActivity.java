package it.ninespartans.xmanager;

import java.lang.System;

@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\t\u001a\u00020\nJ\u0015\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u000e\u00a2\u0006\u0002\u0010\u000fJ\u0015\u0010\u0010\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u000e\u00a2\u0006\u0002\u0010\u000fJ\u0012\u0010\u0011\u001a\u00020\n2\b\u0010\u0012\u001a\u0004\u0018\u00010\u0013H\u0014J\u0015\u0010\u0014\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u000e\u00a2\u0006\u0002\u0010\u000fJ\u0006\u0010\u0015\u001a\u00020\nJ\u000e\u0010\u0016\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\u0017R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\bX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"}, d2 = {"Lit/ninespartans/xmanager/CreateProgramActivity;", "Landroidx/appcompat/app/AppCompatActivity;", "()V", "adapter", "Lit/ninespartans/xmanager/adapters/ProgramStepItemAdapter;", "programId", "", "trainingSessionProgram", "Lit/ninespartans/xmanager/model/TrainingSessionProgram;", "addSessionProgram", "", "hoursBySliderValue", "", "value", "", "(Ljava/lang/Float;)J", "minutesBySliderValue", "onCreate", "savedInstanceState", "Landroid/os/Bundle;", "secondsBySliderValue", "updateList", "updateTimerByValueSlider", "", "app_debug"})
public final class CreateProgramActivity extends androidx.appcompat.app.AppCompatActivity {
    private it.ninespartans.xmanager.adapters.ProgramStepItemAdapter adapter;
    private it.ninespartans.xmanager.model.TrainingSessionProgram trainingSessionProgram;
    private java.lang.String programId;
    private java.util.HashMap _$_findViewCache;
    
    @java.lang.Override()
    protected void onCreate(@org.jetbrains.annotations.Nullable()
    android.os.Bundle savedInstanceState) {
    }
    
    public final void addSessionProgram() {
    }
    
    public final void updateList() {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String updateTimerByValueSlider(int value) {
        return null;
    }
    
    public final long hoursBySliderValue(@org.jetbrains.annotations.Nullable()
    java.lang.Float value) {
        return 0L;
    }
    
    public final long minutesBySliderValue(@org.jetbrains.annotations.Nullable()
    java.lang.Float value) {
        return 0L;
    }
    
    public final long secondsBySliderValue(@org.jetbrains.annotations.Nullable()
    java.lang.Float value) {
        return 0L;
    }
    
    public CreateProgramActivity() {
        super();
    }
}