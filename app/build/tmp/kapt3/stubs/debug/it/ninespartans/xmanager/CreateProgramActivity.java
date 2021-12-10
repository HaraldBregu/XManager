package it.ninespartans.xmanager;

import java.lang.System;

@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000d\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\u0014\u001a\u00020\u0015J\u0015\u0010\u0016\u001a\u00020\u00172\b\u0010\u0018\u001a\u0004\u0018\u00010\u0019\u00a2\u0006\u0002\u0010\u001aJ\u0015\u0010\u001b\u001a\u00020\u00172\b\u0010\u0018\u001a\u0004\u0018\u00010\u0019\u00a2\u0006\u0002\u0010\u001aJ\u0012\u0010\u001c\u001a\u00020\u00152\b\u0010\u001d\u001a\u0004\u0018\u00010\u001eH\u0014J\u000e\u0010\u001f\u001a\u00020 2\u0006\u0010\u0018\u001a\u00020\nJ\u000e\u0010!\u001a\u00020\"2\u0006\u0010\u0018\u001a\u00020\nJ\u0015\u0010#\u001a\u00020\u00172\b\u0010\u0018\u001a\u0004\u0018\u00010\u0019\u00a2\u0006\u0002\u0010\u001aJ\u000e\u0010$\u001a\u00020\u00062\u0006\u0010\u0018\u001a\u00020\nJ\u0006\u0010%\u001a\u00020\u0015J\u0016\u0010&\u001a\u00020\u00152\u0006\u0010\'\u001a\u00020\n2\u0006\u0010(\u001a\u00020)J\u000e\u0010*\u001a\u00020\n2\u0006\u0010\u0018\u001a\u00020\u0006J\u000e\u0010+\u001a\u00020\n2\u0006\u0010\u0018\u001a\u00020\nR\u000e\u0010\u0003\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e\u00a2\u0006\u0004\n\u0002\u0010\u0007R\u0012\u0010\b\u001a\u0004\u0018\u00010\u0006X\u0082\u000e\u00a2\u0006\u0004\n\u0002\u0010\u0007R\u000e\u0010\t\u001a\u00020\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u0004\u0018\u00010\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u0011X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0012\u001a\u0004\u0018\u00010\u0013X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006,"}, d2 = {"Lit/ninespartans/xmanager/CreateProgramActivity;", "Landroidx/appcompat/app/AppCompatActivity;", "()V", "adapter", "Lit/ninespartans/xmanager/adapters/ProgramStepItemAdapter;", "checkedButtonDirectionId", "", "Ljava/lang/Integer;", "checkedRadioButtonAnimationId", "currentLightAnimationType", "", "currentLightDirectionResource", "currentLightDirectionType", "programId", "saveButton", "Lcom/google/android/material/button/MaterialButton;", "shoePairImageView", "Landroid/widget/ImageView;", "trainingSessionProgram", "Lit/ninespartans/xmanager/model/TrainingSessionProgram;", "addSessionProgram", "", "hoursBySliderValue", "", "value", "", "(Ljava/lang/Float;)J", "minutesBySliderValue", "onCreate", "savedInstanceState", "Landroid/os/Bundle;", "programLedAnimation", "Lit/ninespartans/xmanager/model/Program$ShoeLedAnimation;", "programLedPosition", "Lit/ninespartans/xmanager/model/Program$ShoeLedPosition;", "secondsBySliderValue", "updateCurrentLightDirectionResource", "updateList", "updateShoeAnimation", "type", "animation", "Landroid/view/animation/Animation;", "updateTimerByValueSlider", "updateTitleDirection", "app_debug"})
public final class CreateProgramActivity extends androidx.appcompat.app.AppCompatActivity {
    private it.ninespartans.xmanager.adapters.ProgramStepItemAdapter adapter;
    private it.ninespartans.xmanager.model.TrainingSessionProgram trainingSessionProgram;
    private java.lang.String programId;
    private java.lang.Integer checkedRadioButtonAnimationId;
    private java.lang.Integer checkedButtonDirectionId;
    private java.lang.String currentLightAnimationType;
    private java.lang.String currentLightDirectionType;
    private int currentLightDirectionResource;
    private android.widget.ImageView shoePairImageView;
    private com.google.android.material.button.MaterialButton saveButton;
    private java.util.HashMap _$_findViewCache;
    
    @java.lang.Override()
    protected void onCreate(@org.jetbrains.annotations.Nullable()
    android.os.Bundle savedInstanceState) {
    }
    
    public final void addSessionProgram() {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final it.ninespartans.xmanager.model.Program.ShoeLedPosition programLedPosition(@org.jetbrains.annotations.NotNull()
    java.lang.String value) {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final it.ninespartans.xmanager.model.Program.ShoeLedAnimation programLedAnimation(@org.jetbrains.annotations.NotNull()
    java.lang.String value) {
        return null;
    }
    
    public final void updateShoeAnimation(@org.jetbrains.annotations.NotNull()
    java.lang.String type, @org.jetbrains.annotations.NotNull()
    android.view.animation.Animation animation) {
    }
    
    public final int updateCurrentLightDirectionResource(@org.jetbrains.annotations.NotNull()
    java.lang.String value) {
        return 0;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String updateTitleDirection(@org.jetbrains.annotations.NotNull()
    java.lang.String value) {
        return null;
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