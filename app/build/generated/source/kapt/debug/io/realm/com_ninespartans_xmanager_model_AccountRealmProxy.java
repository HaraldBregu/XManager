package io.realm;


import android.annotation.TargetApi;
import android.os.Build;
import android.util.JsonReader;
import android.util.JsonToken;
import io.realm.ImportFlag;
import io.realm.ProxyUtils;
import io.realm.exceptions.RealmMigrationNeededException;
import io.realm.internal.ColumnInfo;
import io.realm.internal.NativeContext;
import io.realm.internal.OsList;
import io.realm.internal.OsMap;
import io.realm.internal.OsObject;
import io.realm.internal.OsObjectSchemaInfo;
import io.realm.internal.OsSchemaInfo;
import io.realm.internal.OsSet;
import io.realm.internal.Property;
import io.realm.internal.RealmObjectProxy;
import io.realm.internal.Row;
import io.realm.internal.Table;
import io.realm.internal.android.JsonUtils;
import io.realm.internal.core.NativeRealmAny;
import io.realm.internal.objectstore.OsObjectBuilder;
import io.realm.log.RealmLog;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@SuppressWarnings("all")
public class com_ninespartans_xmanager_model_AccountRealmProxy extends com.ninespartans.xmanager.model.Account
    implements RealmObjectProxy, com_ninespartans_xmanager_model_AccountRealmProxyInterface {

    static final class AccountColumnInfo extends ColumnInfo {
        long _idColKey;
        long emailAddressColKey;
        long phoneNumberColKey;
        long passwordColKey;
        long createdAtColKey;
        long updatedAtColKey;

        AccountColumnInfo(OsSchemaInfo schemaInfo) {
            super(6);
            OsObjectSchemaInfo objectSchemaInfo = schemaInfo.getObjectSchemaInfo("Account");
            this._idColKey = addColumnDetails("_id", "_id", objectSchemaInfo);
            this.emailAddressColKey = addColumnDetails("emailAddress", "emailAddress", objectSchemaInfo);
            this.phoneNumberColKey = addColumnDetails("phoneNumber", "phoneNumber", objectSchemaInfo);
            this.passwordColKey = addColumnDetails("password", "password", objectSchemaInfo);
            this.createdAtColKey = addColumnDetails("createdAt", "createdAt", objectSchemaInfo);
            this.updatedAtColKey = addColumnDetails("updatedAt", "updatedAt", objectSchemaInfo);
        }

        AccountColumnInfo(ColumnInfo src, boolean mutable) {
            super(src, mutable);
            copy(src, this);
        }

        @Override
        protected final ColumnInfo copy(boolean mutable) {
            return new AccountColumnInfo(this, mutable);
        }

        @Override
        protected final void copy(ColumnInfo rawSrc, ColumnInfo rawDst) {
            final AccountColumnInfo src = (AccountColumnInfo) rawSrc;
            final AccountColumnInfo dst = (AccountColumnInfo) rawDst;
            dst._idColKey = src._idColKey;
            dst.emailAddressColKey = src.emailAddressColKey;
            dst.phoneNumberColKey = src.phoneNumberColKey;
            dst.passwordColKey = src.passwordColKey;
            dst.createdAtColKey = src.createdAtColKey;
            dst.updatedAtColKey = src.updatedAtColKey;
        }
    }

    private static final String NO_ALIAS = "";
    private static final OsObjectSchemaInfo expectedObjectSchemaInfo = createExpectedObjectSchemaInfo();

    private AccountColumnInfo columnInfo;
    private ProxyState<com.ninespartans.xmanager.model.Account> proxyState;

    com_ninespartans_xmanager_model_AccountRealmProxy() {
        proxyState.setConstructionFinished();
    }

    @Override
    public void realm$injectObjectContext() {
        if (this.proxyState != null) {
            return;
        }
        final BaseRealm.RealmObjectContext context = BaseRealm.objectContext.get();
        this.columnInfo = (AccountColumnInfo) context.getColumnInfo();
        this.proxyState = new ProxyState<com.ninespartans.xmanager.model.Account>(this);
        proxyState.setRealm$realm(context.getRealm());
        proxyState.setRow$realm(context.getRow());
        proxyState.setAcceptDefaultValue$realm(context.getAcceptDefaultValue());
        proxyState.setExcludeFields$realm(context.getExcludeFields());
    }

    @Override
    @SuppressWarnings("cast")
    public org.bson.types.ObjectId realmGet$_id() {
        proxyState.getRealm$realm().checkIfValid();
        return (org.bson.types.ObjectId) proxyState.getRow$realm().getObjectId(columnInfo._idColKey);
    }

    @Override
    public void realmSet$_id(org.bson.types.ObjectId value) {
        if (proxyState.isUnderConstruction()) {
            // default value of the primary key is always ignored.
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        throw new io.realm.exceptions.RealmException("Primary key field '_id' cannot be changed after object was created.");
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$emailAddress() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.emailAddressColKey);
    }

    @Override
    public void realmSet$emailAddress(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'emailAddress' to null.");
            }
            row.getTable().setString(columnInfo.emailAddressColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'emailAddress' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.emailAddressColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$phoneNumber() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.phoneNumberColKey);
    }

    @Override
    public void realmSet$phoneNumber(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'phoneNumber' to null.");
            }
            row.getTable().setString(columnInfo.phoneNumberColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'phoneNumber' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.phoneNumberColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$password() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.passwordColKey);
    }

    @Override
    public void realmSet$password(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'password' to null.");
            }
            row.getTable().setString(columnInfo.passwordColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'password' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.passwordColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public Date realmGet$createdAt() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.util.Date) proxyState.getRow$realm().getDate(columnInfo.createdAtColKey);
    }

    @Override
    public void realmSet$createdAt(Date value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'createdAt' to null.");
            }
            row.getTable().setDate(columnInfo.createdAtColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'createdAt' to null.");
        }
        proxyState.getRow$realm().setDate(columnInfo.createdAtColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public Date realmGet$updatedAt() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.util.Date) proxyState.getRow$realm().getDate(columnInfo.updatedAtColKey);
    }

    @Override
    public void realmSet$updatedAt(Date value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'updatedAt' to null.");
            }
            row.getTable().setDate(columnInfo.updatedAtColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'updatedAt' to null.");
        }
        proxyState.getRow$realm().setDate(columnInfo.updatedAtColKey, value);
    }

    private static OsObjectSchemaInfo createExpectedObjectSchemaInfo() {
        OsObjectSchemaInfo.Builder builder = new OsObjectSchemaInfo.Builder(NO_ALIAS, "Account", false, 6, 0);
        builder.addPersistedProperty(NO_ALIAS, "_id", RealmFieldType.OBJECT_ID, Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "emailAddress", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "phoneNumber", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "password", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "createdAt", RealmFieldType.DATE, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "updatedAt", RealmFieldType.DATE, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        return builder.build();
    }

    public static OsObjectSchemaInfo getExpectedObjectSchemaInfo() {
        return expectedObjectSchemaInfo;
    }

    public static AccountColumnInfo createColumnInfo(OsSchemaInfo schemaInfo) {
        return new AccountColumnInfo(schemaInfo);
    }

    public static String getSimpleClassName() {
        return "Account";
    }

    public static final class ClassNameHelper {
        public static final String INTERNAL_CLASS_NAME = "Account";
    }

    @SuppressWarnings("cast")
    public static com.ninespartans.xmanager.model.Account createOrUpdateUsingJsonObject(Realm realm, JSONObject json, boolean update)
        throws JSONException {
        final List<String> excludeFields = Collections.<String> emptyList();
        com.ninespartans.xmanager.model.Account obj = null;
        if (update) {
            Table table = realm.getTable(com.ninespartans.xmanager.model.Account.class);
            AccountColumnInfo columnInfo = (AccountColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.Account.class);
            long pkColumnKey = columnInfo._idColKey;
            long objKey = Table.NO_MATCH;
            if (!json.isNull("_id")) {
                objKey = table.findFirstObjectId(pkColumnKey, (org.bson.types.ObjectId)json.get("_id"));
            }
            if (objKey != Table.NO_MATCH) {
                final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
                try {
                    objectContext.set(realm, table.getUncheckedRow(objKey), realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.Account.class), false, Collections.<String> emptyList());
                    obj = new io.realm.com_ninespartans_xmanager_model_AccountRealmProxy();
                } finally {
                    objectContext.clear();
                }
            }
        }
        if (obj == null) {
            if (json.has("_id")) {
                if (json.isNull("_id")) {
                    obj = (io.realm.com_ninespartans_xmanager_model_AccountRealmProxy) realm.createObjectInternal(com.ninespartans.xmanager.model.Account.class, null, true, excludeFields);
                } else {
                    obj = (io.realm.com_ninespartans_xmanager_model_AccountRealmProxy) realm.createObjectInternal(com.ninespartans.xmanager.model.Account.class, json.get("_id"), true, excludeFields);
                }
            } else {
                throw new IllegalArgumentException("JSON object doesn't have the primary key field '_id'.");
            }
        }

        final com_ninespartans_xmanager_model_AccountRealmProxyInterface objProxy = (com_ninespartans_xmanager_model_AccountRealmProxyInterface) obj;
        if (json.has("emailAddress")) {
            if (json.isNull("emailAddress")) {
                objProxy.realmSet$emailAddress(null);
            } else {
                objProxy.realmSet$emailAddress((String) json.getString("emailAddress"));
            }
        }
        if (json.has("phoneNumber")) {
            if (json.isNull("phoneNumber")) {
                objProxy.realmSet$phoneNumber(null);
            } else {
                objProxy.realmSet$phoneNumber((String) json.getString("phoneNumber"));
            }
        }
        if (json.has("password")) {
            if (json.isNull("password")) {
                objProxy.realmSet$password(null);
            } else {
                objProxy.realmSet$password((String) json.getString("password"));
            }
        }
        if (json.has("createdAt")) {
            if (json.isNull("createdAt")) {
                objProxy.realmSet$createdAt(null);
            } else {
                Object timestamp = json.get("createdAt");
                if (timestamp instanceof String) {
                    objProxy.realmSet$createdAt(JsonUtils.stringToDate((String) timestamp));
                } else {
                    objProxy.realmSet$createdAt(new Date(json.getLong("createdAt")));
                }
            }
        }
        if (json.has("updatedAt")) {
            if (json.isNull("updatedAt")) {
                objProxy.realmSet$updatedAt(null);
            } else {
                Object timestamp = json.get("updatedAt");
                if (timestamp instanceof String) {
                    objProxy.realmSet$updatedAt(JsonUtils.stringToDate((String) timestamp));
                } else {
                    objProxy.realmSet$updatedAt(new Date(json.getLong("updatedAt")));
                }
            }
        }
        return obj;
    }

    @SuppressWarnings("cast")
    @TargetApi(Build.VERSION_CODES.HONEYCOMB)
    public static com.ninespartans.xmanager.model.Account createUsingJsonStream(Realm realm, JsonReader reader)
        throws IOException {
        boolean jsonHasPrimaryKey = false;
        final com.ninespartans.xmanager.model.Account obj = new com.ninespartans.xmanager.model.Account();
        final com_ninespartans_xmanager_model_AccountRealmProxyInterface objProxy = (com_ninespartans_xmanager_model_AccountRealmProxyInterface) obj;
        reader.beginObject();
        while (reader.hasNext()) {
            String name = reader.nextName();
            if (false) {
            } else if (name.equals("_id")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$_id(null);
                } else {
                    objProxy.realmSet$_id(new org.bson.types.ObjectId(reader.nextString()));
                }
            } else if (name.equals("emailAddress")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$emailAddress((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$emailAddress(null);
                }
            } else if (name.equals("phoneNumber")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$phoneNumber((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$phoneNumber(null);
                }
            } else if (name.equals("password")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$password((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$password(null);
                }
            } else if (name.equals("createdAt")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$createdAt(null);
                } else if (reader.peek() == JsonToken.NUMBER) {
                    long timestamp = reader.nextLong();
                    if (timestamp > -1) {
                        objProxy.realmSet$createdAt(new Date(timestamp));
                    }
                } else {
                    objProxy.realmSet$createdAt(JsonUtils.stringToDate(reader.nextString()));
                }
            } else if (name.equals("updatedAt")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$updatedAt(null);
                } else if (reader.peek() == JsonToken.NUMBER) {
                    long timestamp = reader.nextLong();
                    if (timestamp > -1) {
                        objProxy.realmSet$updatedAt(new Date(timestamp));
                    }
                } else {
                    objProxy.realmSet$updatedAt(JsonUtils.stringToDate(reader.nextString()));
                }
            } else {
                reader.skipValue();
            }
        }
        reader.endObject();
        if (!jsonHasPrimaryKey) {
            throw new IllegalArgumentException("JSON object doesn't have the primary key field '_id'.");
        }
        return realm.copyToRealmOrUpdate(obj);
    }

    static com_ninespartans_xmanager_model_AccountRealmProxy newProxyInstance(BaseRealm realm, Row row) {
        // Ignore default values to avoid creating unexpected objects from RealmModel/RealmList fields
        final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
        objectContext.set(realm, row, realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.Account.class), false, Collections.<String>emptyList());
        io.realm.com_ninespartans_xmanager_model_AccountRealmProxy obj = new io.realm.com_ninespartans_xmanager_model_AccountRealmProxy();
        objectContext.clear();
        return obj;
    }

    public static com.ninespartans.xmanager.model.Account copyOrUpdate(Realm realm, AccountColumnInfo columnInfo, com.ninespartans.xmanager.model.Account object, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null) {
            final BaseRealm otherRealm = ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm();
            if (otherRealm.threadId != realm.threadId) {
                throw new IllegalArgumentException("Objects which belong to Realm instances in other threads cannot be copied into this Realm instance.");
            }
            if (otherRealm.getPath().equals(realm.getPath())) {
                return object;
            }
        }
        final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
        RealmObjectProxy cachedRealmObject = cache.get(object);
        if (cachedRealmObject != null) {
            return (com.ninespartans.xmanager.model.Account) cachedRealmObject;
        }

        com.ninespartans.xmanager.model.Account realmObject = null;
        boolean canUpdate = update;
        if (canUpdate) {
            Table table = realm.getTable(com.ninespartans.xmanager.model.Account.class);
            long pkColumnKey = columnInfo._idColKey;
            long objKey = table.findFirstObjectId(pkColumnKey, ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$_id());
            if (objKey == Table.NO_MATCH) {
                canUpdate = false;
            } else {
                try {
                    objectContext.set(realm, table.getUncheckedRow(objKey), columnInfo, false, Collections.<String> emptyList());
                    realmObject = new io.realm.com_ninespartans_xmanager_model_AccountRealmProxy();
                    cache.put(object, (RealmObjectProxy) realmObject);
                } finally {
                    objectContext.clear();
                }
            }
        }

        return (canUpdate) ? update(realm, columnInfo, realmObject, object, cache, flags) : copy(realm, columnInfo, object, update, cache, flags);
    }

    public static com.ninespartans.xmanager.model.Account copy(Realm realm, AccountColumnInfo columnInfo, com.ninespartans.xmanager.model.Account newObject, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
        RealmObjectProxy cachedRealmObject = cache.get(newObject);
        if (cachedRealmObject != null) {
            return (com.ninespartans.xmanager.model.Account) cachedRealmObject;
        }

        com_ninespartans_xmanager_model_AccountRealmProxyInterface unmanagedSource = (com_ninespartans_xmanager_model_AccountRealmProxyInterface) newObject;

        Table table = realm.getTable(com.ninespartans.xmanager.model.Account.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);

        // Add all non-"object reference" fields
        builder.addObjectId(columnInfo._idColKey, unmanagedSource.realmGet$_id());
        builder.addString(columnInfo.emailAddressColKey, unmanagedSource.realmGet$emailAddress());
        builder.addString(columnInfo.phoneNumberColKey, unmanagedSource.realmGet$phoneNumber());
        builder.addString(columnInfo.passwordColKey, unmanagedSource.realmGet$password());
        builder.addDate(columnInfo.createdAtColKey, unmanagedSource.realmGet$createdAt());
        builder.addDate(columnInfo.updatedAtColKey, unmanagedSource.realmGet$updatedAt());

        // Create the underlying object and cache it before setting any object/objectlist references
        // This will allow us to break any circular dependencies by using the object cache.
        Row row = builder.createNewObject();
        io.realm.com_ninespartans_xmanager_model_AccountRealmProxy managedCopy = newProxyInstance(realm, row);
        cache.put(newObject, managedCopy);

        return managedCopy;
    }

    public static long insert(Realm realm, com.ninespartans.xmanager.model.Account object, Map<RealmModel,Long> cache) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
            return ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey();
        }
        Table table = realm.getTable(com.ninespartans.xmanager.model.Account.class);
        long tableNativePtr = table.getNativePtr();
        AccountColumnInfo columnInfo = (AccountColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.Account.class);
        long pkColumnKey = columnInfo._idColKey;
        long objKey = Table.NO_MATCH;
        Object primaryKeyValue = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$_id();
        if (primaryKeyValue != null) {
            objKey = Table.nativeFindFirstObjectId(tableNativePtr, pkColumnKey, ((org.bson.types.ObjectId)primaryKeyValue).toString());
        }
        if (objKey == Table.NO_MATCH) {
            objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
        } else {
            Table.throwDuplicatePrimaryKeyException(primaryKeyValue);
        }
        cache.put(object, objKey);
        String realmGet$emailAddress = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$emailAddress();
        if (realmGet$emailAddress != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.emailAddressColKey, objKey, realmGet$emailAddress, false);
        }
        String realmGet$phoneNumber = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$phoneNumber();
        if (realmGet$phoneNumber != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.phoneNumberColKey, objKey, realmGet$phoneNumber, false);
        }
        String realmGet$password = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$password();
        if (realmGet$password != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.passwordColKey, objKey, realmGet$password, false);
        }
        java.util.Date realmGet$createdAt = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$createdAt();
        if (realmGet$createdAt != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.createdAtColKey, objKey, realmGet$createdAt.getTime(), false);
        }
        java.util.Date realmGet$updatedAt = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$updatedAt();
        if (realmGet$updatedAt != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.updatedAtColKey, objKey, realmGet$updatedAt.getTime(), false);
        }
        return objKey;
    }

    public static void insert(Realm realm, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(com.ninespartans.xmanager.model.Account.class);
        long tableNativePtr = table.getNativePtr();
        AccountColumnInfo columnInfo = (AccountColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.Account.class);
        long pkColumnKey = columnInfo._idColKey;
        com.ninespartans.xmanager.model.Account object = null;
        while (objects.hasNext()) {
            object = (com.ninespartans.xmanager.model.Account) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = Table.NO_MATCH;
            Object primaryKeyValue = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$_id();
            if (primaryKeyValue != null) {
                objKey = Table.nativeFindFirstObjectId(tableNativePtr, pkColumnKey, ((org.bson.types.ObjectId)primaryKeyValue).toString());
            }
            if (objKey == Table.NO_MATCH) {
                objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
            } else {
                Table.throwDuplicatePrimaryKeyException(primaryKeyValue);
            }
            cache.put(object, objKey);
            String realmGet$emailAddress = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$emailAddress();
            if (realmGet$emailAddress != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.emailAddressColKey, objKey, realmGet$emailAddress, false);
            }
            String realmGet$phoneNumber = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$phoneNumber();
            if (realmGet$phoneNumber != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.phoneNumberColKey, objKey, realmGet$phoneNumber, false);
            }
            String realmGet$password = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$password();
            if (realmGet$password != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.passwordColKey, objKey, realmGet$password, false);
            }
            java.util.Date realmGet$createdAt = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$createdAt();
            if (realmGet$createdAt != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.createdAtColKey, objKey, realmGet$createdAt.getTime(), false);
            }
            java.util.Date realmGet$updatedAt = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$updatedAt();
            if (realmGet$updatedAt != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.updatedAtColKey, objKey, realmGet$updatedAt.getTime(), false);
            }
        }
    }

    public static long insertOrUpdate(Realm realm, com.ninespartans.xmanager.model.Account object, Map<RealmModel,Long> cache) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
            return ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey();
        }
        Table table = realm.getTable(com.ninespartans.xmanager.model.Account.class);
        long tableNativePtr = table.getNativePtr();
        AccountColumnInfo columnInfo = (AccountColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.Account.class);
        long pkColumnKey = columnInfo._idColKey;
        long objKey = Table.NO_MATCH;
        Object primaryKeyValue = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$_id();
        if (primaryKeyValue != null) {
            objKey = Table.nativeFindFirstObjectId(tableNativePtr, pkColumnKey, ((org.bson.types.ObjectId)primaryKeyValue).toString());
        }
        if (objKey == Table.NO_MATCH) {
            objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
        }
        cache.put(object, objKey);
        String realmGet$emailAddress = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$emailAddress();
        if (realmGet$emailAddress != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.emailAddressColKey, objKey, realmGet$emailAddress, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.emailAddressColKey, objKey, false);
        }
        String realmGet$phoneNumber = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$phoneNumber();
        if (realmGet$phoneNumber != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.phoneNumberColKey, objKey, realmGet$phoneNumber, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.phoneNumberColKey, objKey, false);
        }
        String realmGet$password = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$password();
        if (realmGet$password != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.passwordColKey, objKey, realmGet$password, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.passwordColKey, objKey, false);
        }
        java.util.Date realmGet$createdAt = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$createdAt();
        if (realmGet$createdAt != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.createdAtColKey, objKey, realmGet$createdAt.getTime(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.createdAtColKey, objKey, false);
        }
        java.util.Date realmGet$updatedAt = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$updatedAt();
        if (realmGet$updatedAt != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.updatedAtColKey, objKey, realmGet$updatedAt.getTime(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.updatedAtColKey, objKey, false);
        }
        return objKey;
    }

    public static void insertOrUpdate(Realm realm, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(com.ninespartans.xmanager.model.Account.class);
        long tableNativePtr = table.getNativePtr();
        AccountColumnInfo columnInfo = (AccountColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.Account.class);
        long pkColumnKey = columnInfo._idColKey;
        com.ninespartans.xmanager.model.Account object = null;
        while (objects.hasNext()) {
            object = (com.ninespartans.xmanager.model.Account) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = Table.NO_MATCH;
            Object primaryKeyValue = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$_id();
            if (primaryKeyValue != null) {
                objKey = Table.nativeFindFirstObjectId(tableNativePtr, pkColumnKey, ((org.bson.types.ObjectId)primaryKeyValue).toString());
            }
            if (objKey == Table.NO_MATCH) {
                objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
            }
            cache.put(object, objKey);
            String realmGet$emailAddress = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$emailAddress();
            if (realmGet$emailAddress != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.emailAddressColKey, objKey, realmGet$emailAddress, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.emailAddressColKey, objKey, false);
            }
            String realmGet$phoneNumber = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$phoneNumber();
            if (realmGet$phoneNumber != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.phoneNumberColKey, objKey, realmGet$phoneNumber, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.phoneNumberColKey, objKey, false);
            }
            String realmGet$password = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$password();
            if (realmGet$password != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.passwordColKey, objKey, realmGet$password, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.passwordColKey, objKey, false);
            }
            java.util.Date realmGet$createdAt = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$createdAt();
            if (realmGet$createdAt != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.createdAtColKey, objKey, realmGet$createdAt.getTime(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.createdAtColKey, objKey, false);
            }
            java.util.Date realmGet$updatedAt = ((com_ninespartans_xmanager_model_AccountRealmProxyInterface) object).realmGet$updatedAt();
            if (realmGet$updatedAt != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.updatedAtColKey, objKey, realmGet$updatedAt.getTime(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.updatedAtColKey, objKey, false);
            }
        }
    }

    public static com.ninespartans.xmanager.model.Account createDetachedCopy(com.ninespartans.xmanager.model.Account realmObject, int currentDepth, int maxDepth, Map<RealmModel, CacheData<RealmModel>> cache) {
        if (currentDepth > maxDepth || realmObject == null) {
            return null;
        }
        CacheData<RealmModel> cachedObject = cache.get(realmObject);
        com.ninespartans.xmanager.model.Account unmanagedObject;
        if (cachedObject == null) {
            unmanagedObject = new com.ninespartans.xmanager.model.Account();
            cache.put(realmObject, new RealmObjectProxy.CacheData<RealmModel>(currentDepth, unmanagedObject));
        } else {
            // Reuse cached object or recreate it because it was encountered at a lower depth.
            if (currentDepth >= cachedObject.minDepth) {
                return (com.ninespartans.xmanager.model.Account) cachedObject.object;
            }
            unmanagedObject = (com.ninespartans.xmanager.model.Account) cachedObject.object;
            cachedObject.minDepth = currentDepth;
        }
        com_ninespartans_xmanager_model_AccountRealmProxyInterface unmanagedCopy = (com_ninespartans_xmanager_model_AccountRealmProxyInterface) unmanagedObject;
        com_ninespartans_xmanager_model_AccountRealmProxyInterface realmSource = (com_ninespartans_xmanager_model_AccountRealmProxyInterface) realmObject;
        Realm objectRealm = (Realm) ((RealmObjectProxy) realmObject).realmGet$proxyState().getRealm$realm();
        unmanagedCopy.realmSet$_id(realmSource.realmGet$_id());
        unmanagedCopy.realmSet$emailAddress(realmSource.realmGet$emailAddress());
        unmanagedCopy.realmSet$phoneNumber(realmSource.realmGet$phoneNumber());
        unmanagedCopy.realmSet$password(realmSource.realmGet$password());
        unmanagedCopy.realmSet$createdAt(realmSource.realmGet$createdAt());
        unmanagedCopy.realmSet$updatedAt(realmSource.realmGet$updatedAt());

        return unmanagedObject;
    }

    static com.ninespartans.xmanager.model.Account update(Realm realm, AccountColumnInfo columnInfo, com.ninespartans.xmanager.model.Account realmObject, com.ninespartans.xmanager.model.Account newObject, Map<RealmModel, RealmObjectProxy> cache, Set<ImportFlag> flags) {
        com_ninespartans_xmanager_model_AccountRealmProxyInterface realmObjectTarget = (com_ninespartans_xmanager_model_AccountRealmProxyInterface) realmObject;
        com_ninespartans_xmanager_model_AccountRealmProxyInterface realmObjectSource = (com_ninespartans_xmanager_model_AccountRealmProxyInterface) newObject;
        Table table = realm.getTable(com.ninespartans.xmanager.model.Account.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);
        builder.addObjectId(columnInfo._idColKey, realmObjectSource.realmGet$_id());
        builder.addString(columnInfo.emailAddressColKey, realmObjectSource.realmGet$emailAddress());
        builder.addString(columnInfo.phoneNumberColKey, realmObjectSource.realmGet$phoneNumber());
        builder.addString(columnInfo.passwordColKey, realmObjectSource.realmGet$password());
        builder.addDate(columnInfo.createdAtColKey, realmObjectSource.realmGet$createdAt());
        builder.addDate(columnInfo.updatedAtColKey, realmObjectSource.realmGet$updatedAt());

        builder.updateExistingTopLevelObject();
        return realmObject;
    }

    @Override
    @SuppressWarnings("ArrayToString")
    public String toString() {
        if (!RealmObject.isValid(this)) {
            return "Invalid object";
        }
        StringBuilder stringBuilder = new StringBuilder("Account = proxy[");
        stringBuilder.append("{_id:");
        stringBuilder.append(realmGet$_id());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{emailAddress:");
        stringBuilder.append(realmGet$emailAddress());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{phoneNumber:");
        stringBuilder.append(realmGet$phoneNumber());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{password:");
        stringBuilder.append(realmGet$password());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{createdAt:");
        stringBuilder.append(realmGet$createdAt());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{updatedAt:");
        stringBuilder.append(realmGet$updatedAt());
        stringBuilder.append("}");
        stringBuilder.append("]");
        return stringBuilder.toString();
    }

    @Override
    public ProxyState<?> realmGet$proxyState() {
        return proxyState;
    }

    @Override
    public int hashCode() {
        String realmName = proxyState.getRealm$realm().getPath();
        String tableName = proxyState.getRow$realm().getTable().getName();
        long objKey = proxyState.getRow$realm().getObjectKey();

        int result = 17;
        result = 31 * result + ((realmName != null) ? realmName.hashCode() : 0);
        result = 31 * result + ((tableName != null) ? tableName.hashCode() : 0);
        result = 31 * result + (int) (objKey ^ (objKey >>> 32));
        return result;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        com_ninespartans_xmanager_model_AccountRealmProxy aAccount = (com_ninespartans_xmanager_model_AccountRealmProxy)o;

        BaseRealm realm = proxyState.getRealm$realm();
        BaseRealm otherRealm = aAccount.proxyState.getRealm$realm();
        String path = realm.getPath();
        String otherPath = otherRealm.getPath();
        if (path != null ? !path.equals(otherPath) : otherPath != null) return false;
        if (realm.isFrozen() != otherRealm.isFrozen()) return false;
        if (!realm.sharedRealm.getVersionID().equals(otherRealm.sharedRealm.getVersionID())) {
            return false;
        }

        String tableName = proxyState.getRow$realm().getTable().getName();
        String otherTableName = aAccount.proxyState.getRow$realm().getTable().getName();
        if (tableName != null ? !tableName.equals(otherTableName) : otherTableName != null) return false;

        if (proxyState.getRow$realm().getObjectKey() != aAccount.proxyState.getRow$realm().getObjectKey()) return false;

        return true;
    }
}
