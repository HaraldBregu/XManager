package com.ninespartans.xmanager;

import java.lang.System;

@kotlin.Metadata(mv = {1, 5, 1}, k = 1, d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u000e\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bJ\u0016\u0010\t\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\n\u001a\u00020\u000bJ\u0012\u0010\f\u001a\u00020\u00062\b\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0014J\u0016\u0010\u000f\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\u0010\u001a\u00020\u000bJ\u001e\u0010\u0011\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\n\u001a\u00020\u000bR\u000e\u0010\u0003\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0014"}, d2 = {"Lcom/ninespartans/xmanager/EditAccountActivity;", "Landroidx/appcompat/app/AppCompatActivity;", "()V", "binding", "Lcom/ninespartans/xmanager/databinding/ActivityEditAccountBinding;", "createNewAccount", "", "realm", "Lio/realm/Realm;", "createUser", "_account", "Lcom/ninespartans/xmanager/model/Account;", "onCreate", "savedInstanceState", "Landroid/os/Bundle;", "updateAccount", "account", "updateUser", "user", "Lcom/ninespartans/xmanager/model/User;", "app_debug"})
public final class EditAccountActivity extends androidx.appcompat.app.AppCompatActivity {
    private com.ninespartans.xmanager.databinding.ActivityEditAccountBinding binding;
    
    public EditAccountActivity() {
        super();
    }
    
    @java.lang.Override()
    protected void onCreate(@org.jetbrains.annotations.Nullable()
    android.os.Bundle savedInstanceState) {
    }
    
    public final void createNewAccount(@org.jetbrains.annotations.NotNull()
    io.realm.Realm realm) {
    }
    
    public final void updateAccount(@org.jetbrains.annotations.NotNull()
    io.realm.Realm realm, @org.jetbrains.annotations.NotNull()
    com.ninespartans.xmanager.model.Account account) {
    }
    
    public final void createUser(@org.jetbrains.annotations.NotNull()
    io.realm.Realm realm, @org.jetbrains.annotations.NotNull()
    com.ninespartans.xmanager.model.Account _account) {
    }
    
    public final void updateUser(@org.jetbrains.annotations.NotNull()
    io.realm.Realm realm, @org.jetbrains.annotations.NotNull()
    com.ninespartans.xmanager.model.User user, @org.jetbrains.annotations.NotNull()
    com.ninespartans.xmanager.model.Account _account) {
    }
}