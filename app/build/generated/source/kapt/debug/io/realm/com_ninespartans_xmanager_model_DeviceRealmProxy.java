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
public class com_ninespartans_xmanager_model_DeviceRealmProxy extends com.ninespartans.xmanager.model.Device
    implements RealmObjectProxy, com_ninespartans_xmanager_model_DeviceRealmProxyInterface {

    static final class DeviceColumnInfo extends ColumnInfo {
        long _idColKey;
        long nameColKey;
        long versionColKey;
        long typeColKey;
        long macColKey;
        long ble_macColKey;
        long wifi_macColKey;
        long programColKey;
        long userColKey;
        long createdAtColKey;
        long updatedAtColKey;

        DeviceColumnInfo(OsSchemaInfo schemaInfo) {
            super(11);
            OsObjectSchemaInfo objectSchemaInfo = schemaInfo.getObjectSchemaInfo("Device");
            this._idColKey = addColumnDetails("_id", "_id", objectSchemaInfo);
            this.nameColKey = addColumnDetails("name", "name", objectSchemaInfo);
            this.versionColKey = addColumnDetails("version", "version", objectSchemaInfo);
            this.typeColKey = addColumnDetails("type", "type", objectSchemaInfo);
            this.macColKey = addColumnDetails("mac", "mac", objectSchemaInfo);
            this.ble_macColKey = addColumnDetails("ble_mac", "ble_mac", objectSchemaInfo);
            this.wifi_macColKey = addColumnDetails("wifi_mac", "wifi_mac", objectSchemaInfo);
            this.programColKey = addColumnDetails("program", "program", objectSchemaInfo);
            this.userColKey = addColumnDetails("user", "user", objectSchemaInfo);
            this.createdAtColKey = addColumnDetails("createdAt", "createdAt", objectSchemaInfo);
            this.updatedAtColKey = addColumnDetails("updatedAt", "updatedAt", objectSchemaInfo);
        }

        DeviceColumnInfo(ColumnInfo src, boolean mutable) {
            super(src, mutable);
            copy(src, this);
        }

        @Override
        protected final ColumnInfo copy(boolean mutable) {
            return new DeviceColumnInfo(this, mutable);
        }

        @Override
        protected final void copy(ColumnInfo rawSrc, ColumnInfo rawDst) {
            final DeviceColumnInfo src = (DeviceColumnInfo) rawSrc;
            final DeviceColumnInfo dst = (DeviceColumnInfo) rawDst;
            dst._idColKey = src._idColKey;
            dst.nameColKey = src.nameColKey;
            dst.versionColKey = src.versionColKey;
            dst.typeColKey = src.typeColKey;
            dst.macColKey = src.macColKey;
            dst.ble_macColKey = src.ble_macColKey;
            dst.wifi_macColKey = src.wifi_macColKey;
            dst.programColKey = src.programColKey;
            dst.userColKey = src.userColKey;
            dst.createdAtColKey = src.createdAtColKey;
            dst.updatedAtColKey = src.updatedAtColKey;
        }
    }

    private static final String NO_ALIAS = "";
    private static final OsObjectSchemaInfo expectedObjectSchemaInfo = createExpectedObjectSchemaInfo();

    private DeviceColumnInfo columnInfo;
    private ProxyState<com.ninespartans.xmanager.model.Device> proxyState;

    com_ninespartans_xmanager_model_DeviceRealmProxy() {
        proxyState.setConstructionFinished();
    }

    @Override
    public void realm$injectObjectContext() {
        if (this.proxyState != null) {
            return;
        }
        final BaseRealm.RealmObjectContext context = BaseRealm.objectContext.get();
        this.columnInfo = (DeviceColumnInfo) context.getColumnInfo();
        this.proxyState = new ProxyState<com.ninespartans.xmanager.model.Device>(this);
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
    public String realmGet$name() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.nameColKey);
    }

    @Override
    public void realmSet$name(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'name' to null.");
            }
            row.getTable().setString(columnInfo.nameColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'name' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.nameColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$version() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.versionColKey);
    }

    @Override
    public void realmSet$version(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'version' to null.");
            }
            row.getTable().setString(columnInfo.versionColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'version' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.versionColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$type() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.typeColKey);
    }

    @Override
    public void realmSet$type(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'type' to null.");
            }
            row.getTable().setString(columnInfo.typeColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'type' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.typeColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$mac() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.macColKey);
    }

    @Override
    public void realmSet$mac(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'mac' to null.");
            }
            row.getTable().setString(columnInfo.macColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'mac' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.macColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$ble_mac() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.ble_macColKey);
    }

    @Override
    public void realmSet$ble_mac(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'ble_mac' to null.");
            }
            row.getTable().setString(columnInfo.ble_macColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'ble_mac' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.ble_macColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public String realmGet$wifi_mac() {
        proxyState.getRealm$realm().checkIfValid();
        return (java.lang.String) proxyState.getRow$realm().getString(columnInfo.wifi_macColKey);
    }

    @Override
    public void realmSet$wifi_mac(String value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                throw new IllegalArgumentException("Trying to set non-nullable field 'wifi_mac' to null.");
            }
            row.getTable().setString(columnInfo.wifi_macColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            throw new IllegalArgumentException("Trying to set non-nullable field 'wifi_mac' to null.");
        }
        proxyState.getRow$realm().setString(columnInfo.wifi_macColKey, value);
    }

    @Override
    public com.ninespartans.xmanager.model.DeviceProgram realmGet$program() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNullLink(columnInfo.programColKey)) {
            return null;
        }
        return proxyState.getRealm$realm().get(com.ninespartans.xmanager.model.DeviceProgram.class, proxyState.getRow$realm().getLink(columnInfo.programColKey), false, Collections.<String>emptyList());
    }

    @Override
    public void realmSet$program(com.ninespartans.xmanager.model.DeviceProgram value) {
        Realm realm = (Realm) proxyState.getRealm$realm();
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            if (proxyState.getExcludeFields$realm().contains("program")) {
                return;
            }
            if (value != null && !RealmObject.isManaged(value)) {
                value = realm.copyToRealmOrUpdate(value);
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                // Table#nullifyLink() does not support default value. Just using Row.
                row.nullifyLink(columnInfo.programColKey);
                return;
            }
            proxyState.checkValidObject(value);
            row.getTable().setLink(columnInfo.programColKey, row.getObjectKey(), ((RealmObjectProxy) value).realmGet$proxyState().getRow$realm().getObjectKey(), true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().nullifyLink(columnInfo.programColKey);
            return;
        }
        proxyState.checkValidObject(value);
        proxyState.getRow$realm().setLink(columnInfo.programColKey, ((RealmObjectProxy) value).realmGet$proxyState().getRow$realm().getObjectKey());
    }

    @Override
    public com.ninespartans.xmanager.model.User realmGet$user() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNullLink(columnInfo.userColKey)) {
            return null;
        }
        return proxyState.getRealm$realm().get(com.ninespartans.xmanager.model.User.class, proxyState.getRow$realm().getLink(columnInfo.userColKey), false, Collections.<String>emptyList());
    }

    @Override
    public void realmSet$user(com.ninespartans.xmanager.model.User value) {
        Realm realm = (Realm) proxyState.getRealm$realm();
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            if (proxyState.getExcludeFields$realm().contains("user")) {
                return;
            }
            if (value != null && !RealmObject.isManaged(value)) {
                value = realm.copyToRealmOrUpdate(value);
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                // Table#nullifyLink() does not support default value. Just using Row.
                row.nullifyLink(columnInfo.userColKey);
                return;
            }
            proxyState.checkValidObject(value);
            row.getTable().setLink(columnInfo.userColKey, row.getObjectKey(), ((RealmObjectProxy) value).realmGet$proxyState().getRow$realm().getObjectKey(), true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().nullifyLink(columnInfo.userColKey);
            return;
        }
        proxyState.checkValidObject(value);
        proxyState.getRow$realm().setLink(columnInfo.userColKey, ((RealmObjectProxy) value).realmGet$proxyState().getRow$realm().getObjectKey());
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
        OsObjectSchemaInfo.Builder builder = new OsObjectSchemaInfo.Builder(NO_ALIAS, "Device", false, 11, 0);
        builder.addPersistedProperty(NO_ALIAS, "_id", RealmFieldType.OBJECT_ID, Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "name", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "version", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "type", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "mac", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "ble_mac", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "wifi_mac", RealmFieldType.STRING, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedLinkProperty(NO_ALIAS, "program", RealmFieldType.OBJECT, "DeviceProgram");
        builder.addPersistedLinkProperty(NO_ALIAS, "user", RealmFieldType.OBJECT, "User");
        builder.addPersistedProperty(NO_ALIAS, "createdAt", RealmFieldType.DATE, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "updatedAt", RealmFieldType.DATE, !Property.PRIMARY_KEY, !Property.INDEXED, Property.REQUIRED);
        return builder.build();
    }

    public static OsObjectSchemaInfo getExpectedObjectSchemaInfo() {
        return expectedObjectSchemaInfo;
    }

    public static DeviceColumnInfo createColumnInfo(OsSchemaInfo schemaInfo) {
        return new DeviceColumnInfo(schemaInfo);
    }

    public static String getSimpleClassName() {
        return "Device";
    }

    public static final class ClassNameHelper {
        public static final String INTERNAL_CLASS_NAME = "Device";
    }

    @SuppressWarnings("cast")
    public static com.ninespartans.xmanager.model.Device createOrUpdateUsingJsonObject(Realm realm, JSONObject json, boolean update)
        throws JSONException {
        final List<String> excludeFields = new ArrayList<String>(2);
        com.ninespartans.xmanager.model.Device obj = null;
        if (update) {
            Table table = realm.getTable(com.ninespartans.xmanager.model.Device.class);
            DeviceColumnInfo columnInfo = (DeviceColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.Device.class);
            long pkColumnKey = columnInfo._idColKey;
            long objKey = Table.NO_MATCH;
            if (!json.isNull("_id")) {
                objKey = table.findFirstObjectId(pkColumnKey, (org.bson.types.ObjectId)json.get("_id"));
            }
            if (objKey != Table.NO_MATCH) {
                final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
                try {
                    objectContext.set(realm, table.getUncheckedRow(objKey), realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.Device.class), false, Collections.<String> emptyList());
                    obj = new io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy();
                } finally {
                    objectContext.clear();
                }
            }
        }
        if (obj == null) {
            if (json.has("program")) {
                excludeFields.add("program");
            }
            if (json.has("user")) {
                excludeFields.add("user");
            }
            if (json.has("_id")) {
                if (json.isNull("_id")) {
                    obj = (io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy) realm.createObjectInternal(com.ninespartans.xmanager.model.Device.class, null, true, excludeFields);
                } else {
                    obj = (io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy) realm.createObjectInternal(com.ninespartans.xmanager.model.Device.class, json.get("_id"), true, excludeFields);
                }
            } else {
                throw new IllegalArgumentException("JSON object doesn't have the primary key field '_id'.");
            }
        }

        final com_ninespartans_xmanager_model_DeviceRealmProxyInterface objProxy = (com_ninespartans_xmanager_model_DeviceRealmProxyInterface) obj;
        if (json.has("name")) {
            if (json.isNull("name")) {
                objProxy.realmSet$name(null);
            } else {
                objProxy.realmSet$name((String) json.getString("name"));
            }
        }
        if (json.has("version")) {
            if (json.isNull("version")) {
                objProxy.realmSet$version(null);
            } else {
                objProxy.realmSet$version((String) json.getString("version"));
            }
        }
        if (json.has("type")) {
            if (json.isNull("type")) {
                objProxy.realmSet$type(null);
            } else {
                objProxy.realmSet$type((String) json.getString("type"));
            }
        }
        if (json.has("mac")) {
            if (json.isNull("mac")) {
                objProxy.realmSet$mac(null);
            } else {
                objProxy.realmSet$mac((String) json.getString("mac"));
            }
        }
        if (json.has("ble_mac")) {
            if (json.isNull("ble_mac")) {
                objProxy.realmSet$ble_mac(null);
            } else {
                objProxy.realmSet$ble_mac((String) json.getString("ble_mac"));
            }
        }
        if (json.has("wifi_mac")) {
            if (json.isNull("wifi_mac")) {
                objProxy.realmSet$wifi_mac(null);
            } else {
                objProxy.realmSet$wifi_mac((String) json.getString("wifi_mac"));
            }
        }
        if (json.has("program")) {
            if (json.isNull("program")) {
                objProxy.realmSet$program(null);
            } else {
                com.ninespartans.xmanager.model.DeviceProgram programObj = com_ninespartans_xmanager_model_DeviceProgramRealmProxy.createOrUpdateUsingJsonObject(realm, json.getJSONObject("program"), update);
                objProxy.realmSet$program(programObj);
            }
        }
        if (json.has("user")) {
            if (json.isNull("user")) {
                objProxy.realmSet$user(null);
            } else {
                com.ninespartans.xmanager.model.User userObj = com_ninespartans_xmanager_model_UserRealmProxy.createOrUpdateUsingJsonObject(realm, json.getJSONObject("user"), update);
                objProxy.realmSet$user(userObj);
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
    public static com.ninespartans.xmanager.model.Device createUsingJsonStream(Realm realm, JsonReader reader)
        throws IOException {
        boolean jsonHasPrimaryKey = false;
        final com.ninespartans.xmanager.model.Device obj = new com.ninespartans.xmanager.model.Device();
        final com_ninespartans_xmanager_model_DeviceRealmProxyInterface objProxy = (com_ninespartans_xmanager_model_DeviceRealmProxyInterface) obj;
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
            } else if (name.equals("name")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$name((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$name(null);
                }
            } else if (name.equals("version")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$version((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$version(null);
                }
            } else if (name.equals("type")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$type((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$type(null);
                }
            } else if (name.equals("mac")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$mac((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$mac(null);
                }
            } else if (name.equals("ble_mac")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$ble_mac((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$ble_mac(null);
                }
            } else if (name.equals("wifi_mac")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$wifi_mac((String) reader.nextString());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$wifi_mac(null);
                }
            } else if (name.equals("program")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$program(null);
                } else {
                    com.ninespartans.xmanager.model.DeviceProgram programObj = com_ninespartans_xmanager_model_DeviceProgramRealmProxy.createUsingJsonStream(realm, reader);
                    objProxy.realmSet$program(programObj);
                }
            } else if (name.equals("user")) {
                if (reader.peek() == JsonToken.NULL) {
                    reader.skipValue();
                    objProxy.realmSet$user(null);
                } else {
                    com.ninespartans.xmanager.model.User userObj = com_ninespartans_xmanager_model_UserRealmProxy.createUsingJsonStream(realm, reader);
                    objProxy.realmSet$user(userObj);
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

    static com_ninespartans_xmanager_model_DeviceRealmProxy newProxyInstance(BaseRealm realm, Row row) {
        // Ignore default values to avoid creating unexpected objects from RealmModel/RealmList fields
        final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
        objectContext.set(realm, row, realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.Device.class), false, Collections.<String>emptyList());
        io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy obj = new io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy();
        objectContext.clear();
        return obj;
    }

    public static com.ninespartans.xmanager.model.Device copyOrUpdate(Realm realm, DeviceColumnInfo columnInfo, com.ninespartans.xmanager.model.Device object, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
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
            return (com.ninespartans.xmanager.model.Device) cachedRealmObject;
        }

        com.ninespartans.xmanager.model.Device realmObject = null;
        boolean canUpdate = update;
        if (canUpdate) {
            Table table = realm.getTable(com.ninespartans.xmanager.model.Device.class);
            long pkColumnKey = columnInfo._idColKey;
            long objKey = table.findFirstObjectId(pkColumnKey, ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$_id());
            if (objKey == Table.NO_MATCH) {
                canUpdate = false;
            } else {
                try {
                    objectContext.set(realm, table.getUncheckedRow(objKey), columnInfo, false, Collections.<String> emptyList());
                    realmObject = new io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy();
                    cache.put(object, (RealmObjectProxy) realmObject);
                } finally {
                    objectContext.clear();
                }
            }
        }

        return (canUpdate) ? update(realm, columnInfo, realmObject, object, cache, flags) : copy(realm, columnInfo, object, update, cache, flags);
    }

    public static com.ninespartans.xmanager.model.Device copy(Realm realm, DeviceColumnInfo columnInfo, com.ninespartans.xmanager.model.Device newObject, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
        RealmObjectProxy cachedRealmObject = cache.get(newObject);
        if (cachedRealmObject != null) {
            return (com.ninespartans.xmanager.model.Device) cachedRealmObject;
        }

        com_ninespartans_xmanager_model_DeviceRealmProxyInterface unmanagedSource = (com_ninespartans_xmanager_model_DeviceRealmProxyInterface) newObject;

        Table table = realm.getTable(com.ninespartans.xmanager.model.Device.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);

        // Add all non-"object reference" fields
        builder.addObjectId(columnInfo._idColKey, unmanagedSource.realmGet$_id());
        builder.addString(columnInfo.nameColKey, unmanagedSource.realmGet$name());
        builder.addString(columnInfo.versionColKey, unmanagedSource.realmGet$version());
        builder.addString(columnInfo.typeColKey, unmanagedSource.realmGet$type());
        builder.addString(columnInfo.macColKey, unmanagedSource.realmGet$mac());
        builder.addString(columnInfo.ble_macColKey, unmanagedSource.realmGet$ble_mac());
        builder.addString(columnInfo.wifi_macColKey, unmanagedSource.realmGet$wifi_mac());
        builder.addDate(columnInfo.createdAtColKey, unmanagedSource.realmGet$createdAt());
        builder.addDate(columnInfo.updatedAtColKey, unmanagedSource.realmGet$updatedAt());

        // Create the underlying object and cache it before setting any object/objectlist references
        // This will allow us to break any circular dependencies by using the object cache.
        Row row = builder.createNewObject();
        io.realm.com_ninespartans_xmanager_model_DeviceRealmProxy managedCopy = newProxyInstance(realm, row);
        cache.put(newObject, managedCopy);

        // Finally add all fields that reference other Realm Objects, either directly or through a list
        com.ninespartans.xmanager.model.DeviceProgram programObj = unmanagedSource.realmGet$program();
        if (programObj == null) {
            managedCopy.realmSet$program(null);
        } else {
            com.ninespartans.xmanager.model.DeviceProgram cacheprogram = (com.ninespartans.xmanager.model.DeviceProgram) cache.get(programObj);
            if (cacheprogram != null) {
                managedCopy.realmSet$program(cacheprogram);
            } else {
                managedCopy.realmSet$program(com_ninespartans_xmanager_model_DeviceProgramRealmProxy.copyOrUpdate(realm, (com_ninespartans_xmanager_model_DeviceProgramRealmProxy.DeviceProgramColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.DeviceProgram.class), programObj, update, cache, flags));
            }
        }

        com.ninespartans.xmanager.model.User userObj = unmanagedSource.realmGet$user();
        if (userObj == null) {
            managedCopy.realmSet$user(null);
        } else {
            com.ninespartans.xmanager.model.User cacheuser = (com.ninespartans.xmanager.model.User) cache.get(userObj);
            if (cacheuser != null) {
                managedCopy.realmSet$user(cacheuser);
            } else {
                managedCopy.realmSet$user(com_ninespartans_xmanager_model_UserRealmProxy.copyOrUpdate(realm, (com_ninespartans_xmanager_model_UserRealmProxy.UserColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.User.class), userObj, update, cache, flags));
            }
        }

        return managedCopy;
    }

    public static long insert(Realm realm, com.ninespartans.xmanager.model.Device object, Map<RealmModel,Long> cache) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
            return ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey();
        }
        Table table = realm.getTable(com.ninespartans.xmanager.model.Device.class);
        long tableNativePtr = table.getNativePtr();
        DeviceColumnInfo columnInfo = (DeviceColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.Device.class);
        long pkColumnKey = columnInfo._idColKey;
        long objKey = Table.NO_MATCH;
        Object primaryKeyValue = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$_id();
        if (primaryKeyValue != null) {
            objKey = Table.nativeFindFirstObjectId(tableNativePtr, pkColumnKey, ((org.bson.types.ObjectId)primaryKeyValue).toString());
        }
        if (objKey == Table.NO_MATCH) {
            objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
        } else {
            Table.throwDuplicatePrimaryKeyException(primaryKeyValue);
        }
        cache.put(object, objKey);
        String realmGet$name = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$name();
        if (realmGet$name != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.nameColKey, objKey, realmGet$name, false);
        }
        String realmGet$version = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$version();
        if (realmGet$version != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.versionColKey, objKey, realmGet$version, false);
        }
        String realmGet$type = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$type();
        if (realmGet$type != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.typeColKey, objKey, realmGet$type, false);
        }
        String realmGet$mac = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$mac();
        if (realmGet$mac != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.macColKey, objKey, realmGet$mac, false);
        }
        String realmGet$ble_mac = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$ble_mac();
        if (realmGet$ble_mac != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.ble_macColKey, objKey, realmGet$ble_mac, false);
        }
        String realmGet$wifi_mac = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$wifi_mac();
        if (realmGet$wifi_mac != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.wifi_macColKey, objKey, realmGet$wifi_mac, false);
        }

        com.ninespartans.xmanager.model.DeviceProgram programObj = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$program();
        if (programObj != null) {
            Long cacheprogram = cache.get(programObj);
            if (cacheprogram == null) {
                cacheprogram = com_ninespartans_xmanager_model_DeviceProgramRealmProxy.insert(realm, programObj, cache);
            }
            Table.nativeSetLink(tableNativePtr, columnInfo.programColKey, objKey, cacheprogram, false);
        }

        com.ninespartans.xmanager.model.User userObj = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$user();
        if (userObj != null) {
            Long cacheuser = cache.get(userObj);
            if (cacheuser == null) {
                cacheuser = com_ninespartans_xmanager_model_UserRealmProxy.insert(realm, userObj, cache);
            }
            Table.nativeSetLink(tableNativePtr, columnInfo.userColKey, objKey, cacheuser, false);
        }
        java.util.Date realmGet$createdAt = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$createdAt();
        if (realmGet$createdAt != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.createdAtColKey, objKey, realmGet$createdAt.getTime(), false);
        }
        java.util.Date realmGet$updatedAt = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$updatedAt();
        if (realmGet$updatedAt != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.updatedAtColKey, objKey, realmGet$updatedAt.getTime(), false);
        }
        return objKey;
    }

    public static void insert(Realm realm, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(com.ninespartans.xmanager.model.Device.class);
        long tableNativePtr = table.getNativePtr();
        DeviceColumnInfo columnInfo = (DeviceColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.Device.class);
        long pkColumnKey = columnInfo._idColKey;
        com.ninespartans.xmanager.model.Device object = null;
        while (objects.hasNext()) {
            object = (com.ninespartans.xmanager.model.Device) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = Table.NO_MATCH;
            Object primaryKeyValue = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$_id();
            if (primaryKeyValue != null) {
                objKey = Table.nativeFindFirstObjectId(tableNativePtr, pkColumnKey, ((org.bson.types.ObjectId)primaryKeyValue).toString());
            }
            if (objKey == Table.NO_MATCH) {
                objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
            } else {
                Table.throwDuplicatePrimaryKeyException(primaryKeyValue);
            }
            cache.put(object, objKey);
            String realmGet$name = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$name();
            if (realmGet$name != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.nameColKey, objKey, realmGet$name, false);
            }
            String realmGet$version = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$version();
            if (realmGet$version != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.versionColKey, objKey, realmGet$version, false);
            }
            String realmGet$type = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$type();
            if (realmGet$type != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.typeColKey, objKey, realmGet$type, false);
            }
            String realmGet$mac = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$mac();
            if (realmGet$mac != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.macColKey, objKey, realmGet$mac, false);
            }
            String realmGet$ble_mac = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$ble_mac();
            if (realmGet$ble_mac != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.ble_macColKey, objKey, realmGet$ble_mac, false);
            }
            String realmGet$wifi_mac = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$wifi_mac();
            if (realmGet$wifi_mac != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.wifi_macColKey, objKey, realmGet$wifi_mac, false);
            }

            com.ninespartans.xmanager.model.DeviceProgram programObj = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$program();
            if (programObj != null) {
                Long cacheprogram = cache.get(programObj);
                if (cacheprogram == null) {
                    cacheprogram = com_ninespartans_xmanager_model_DeviceProgramRealmProxy.insert(realm, programObj, cache);
                }
                Table.nativeSetLink(tableNativePtr, columnInfo.programColKey, objKey, cacheprogram, false);
            }

            com.ninespartans.xmanager.model.User userObj = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$user();
            if (userObj != null) {
                Long cacheuser = cache.get(userObj);
                if (cacheuser == null) {
                    cacheuser = com_ninespartans_xmanager_model_UserRealmProxy.insert(realm, userObj, cache);
                }
                Table.nativeSetLink(tableNativePtr, columnInfo.userColKey, objKey, cacheuser, false);
            }
            java.util.Date realmGet$createdAt = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$createdAt();
            if (realmGet$createdAt != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.createdAtColKey, objKey, realmGet$createdAt.getTime(), false);
            }
            java.util.Date realmGet$updatedAt = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$updatedAt();
            if (realmGet$updatedAt != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.updatedAtColKey, objKey, realmGet$updatedAt.getTime(), false);
            }
        }
    }

    public static long insertOrUpdate(Realm realm, com.ninespartans.xmanager.model.Device object, Map<RealmModel,Long> cache) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
            return ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey();
        }
        Table table = realm.getTable(com.ninespartans.xmanager.model.Device.class);
        long tableNativePtr = table.getNativePtr();
        DeviceColumnInfo columnInfo = (DeviceColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.Device.class);
        long pkColumnKey = columnInfo._idColKey;
        long objKey = Table.NO_MATCH;
        Object primaryKeyValue = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$_id();
        if (primaryKeyValue != null) {
            objKey = Table.nativeFindFirstObjectId(tableNativePtr, pkColumnKey, ((org.bson.types.ObjectId)primaryKeyValue).toString());
        }
        if (objKey == Table.NO_MATCH) {
            objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
        }
        cache.put(object, objKey);
        String realmGet$name = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$name();
        if (realmGet$name != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.nameColKey, objKey, realmGet$name, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.nameColKey, objKey, false);
        }
        String realmGet$version = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$version();
        if (realmGet$version != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.versionColKey, objKey, realmGet$version, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.versionColKey, objKey, false);
        }
        String realmGet$type = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$type();
        if (realmGet$type != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.typeColKey, objKey, realmGet$type, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.typeColKey, objKey, false);
        }
        String realmGet$mac = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$mac();
        if (realmGet$mac != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.macColKey, objKey, realmGet$mac, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.macColKey, objKey, false);
        }
        String realmGet$ble_mac = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$ble_mac();
        if (realmGet$ble_mac != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.ble_macColKey, objKey, realmGet$ble_mac, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.ble_macColKey, objKey, false);
        }
        String realmGet$wifi_mac = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$wifi_mac();
        if (realmGet$wifi_mac != null) {
            Table.nativeSetString(tableNativePtr, columnInfo.wifi_macColKey, objKey, realmGet$wifi_mac, false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.wifi_macColKey, objKey, false);
        }

        com.ninespartans.xmanager.model.DeviceProgram programObj = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$program();
        if (programObj != null) {
            Long cacheprogram = cache.get(programObj);
            if (cacheprogram == null) {
                cacheprogram = com_ninespartans_xmanager_model_DeviceProgramRealmProxy.insertOrUpdate(realm, programObj, cache);
            }
            Table.nativeSetLink(tableNativePtr, columnInfo.programColKey, objKey, cacheprogram, false);
        } else {
            Table.nativeNullifyLink(tableNativePtr, columnInfo.programColKey, objKey);
        }

        com.ninespartans.xmanager.model.User userObj = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$user();
        if (userObj != null) {
            Long cacheuser = cache.get(userObj);
            if (cacheuser == null) {
                cacheuser = com_ninespartans_xmanager_model_UserRealmProxy.insertOrUpdate(realm, userObj, cache);
            }
            Table.nativeSetLink(tableNativePtr, columnInfo.userColKey, objKey, cacheuser, false);
        } else {
            Table.nativeNullifyLink(tableNativePtr, columnInfo.userColKey, objKey);
        }
        java.util.Date realmGet$createdAt = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$createdAt();
        if (realmGet$createdAt != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.createdAtColKey, objKey, realmGet$createdAt.getTime(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.createdAtColKey, objKey, false);
        }
        java.util.Date realmGet$updatedAt = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$updatedAt();
        if (realmGet$updatedAt != null) {
            Table.nativeSetTimestamp(tableNativePtr, columnInfo.updatedAtColKey, objKey, realmGet$updatedAt.getTime(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.updatedAtColKey, objKey, false);
        }
        return objKey;
    }

    public static void insertOrUpdate(Realm realm, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(com.ninespartans.xmanager.model.Device.class);
        long tableNativePtr = table.getNativePtr();
        DeviceColumnInfo columnInfo = (DeviceColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.Device.class);
        long pkColumnKey = columnInfo._idColKey;
        com.ninespartans.xmanager.model.Device object = null;
        while (objects.hasNext()) {
            object = (com.ninespartans.xmanager.model.Device) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = Table.NO_MATCH;
            Object primaryKeyValue = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$_id();
            if (primaryKeyValue != null) {
                objKey = Table.nativeFindFirstObjectId(tableNativePtr, pkColumnKey, ((org.bson.types.ObjectId)primaryKeyValue).toString());
            }
            if (objKey == Table.NO_MATCH) {
                objKey = OsObject.createRowWithPrimaryKey(table, pkColumnKey, primaryKeyValue);
            }
            cache.put(object, objKey);
            String realmGet$name = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$name();
            if (realmGet$name != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.nameColKey, objKey, realmGet$name, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.nameColKey, objKey, false);
            }
            String realmGet$version = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$version();
            if (realmGet$version != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.versionColKey, objKey, realmGet$version, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.versionColKey, objKey, false);
            }
            String realmGet$type = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$type();
            if (realmGet$type != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.typeColKey, objKey, realmGet$type, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.typeColKey, objKey, false);
            }
            String realmGet$mac = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$mac();
            if (realmGet$mac != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.macColKey, objKey, realmGet$mac, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.macColKey, objKey, false);
            }
            String realmGet$ble_mac = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$ble_mac();
            if (realmGet$ble_mac != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.ble_macColKey, objKey, realmGet$ble_mac, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.ble_macColKey, objKey, false);
            }
            String realmGet$wifi_mac = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$wifi_mac();
            if (realmGet$wifi_mac != null) {
                Table.nativeSetString(tableNativePtr, columnInfo.wifi_macColKey, objKey, realmGet$wifi_mac, false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.wifi_macColKey, objKey, false);
            }

            com.ninespartans.xmanager.model.DeviceProgram programObj = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$program();
            if (programObj != null) {
                Long cacheprogram = cache.get(programObj);
                if (cacheprogram == null) {
                    cacheprogram = com_ninespartans_xmanager_model_DeviceProgramRealmProxy.insertOrUpdate(realm, programObj, cache);
                }
                Table.nativeSetLink(tableNativePtr, columnInfo.programColKey, objKey, cacheprogram, false);
            } else {
                Table.nativeNullifyLink(tableNativePtr, columnInfo.programColKey, objKey);
            }

            com.ninespartans.xmanager.model.User userObj = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$user();
            if (userObj != null) {
                Long cacheuser = cache.get(userObj);
                if (cacheuser == null) {
                    cacheuser = com_ninespartans_xmanager_model_UserRealmProxy.insertOrUpdate(realm, userObj, cache);
                }
                Table.nativeSetLink(tableNativePtr, columnInfo.userColKey, objKey, cacheuser, false);
            } else {
                Table.nativeNullifyLink(tableNativePtr, columnInfo.userColKey, objKey);
            }
            java.util.Date realmGet$createdAt = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$createdAt();
            if (realmGet$createdAt != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.createdAtColKey, objKey, realmGet$createdAt.getTime(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.createdAtColKey, objKey, false);
            }
            java.util.Date realmGet$updatedAt = ((com_ninespartans_xmanager_model_DeviceRealmProxyInterface) object).realmGet$updatedAt();
            if (realmGet$updatedAt != null) {
                Table.nativeSetTimestamp(tableNativePtr, columnInfo.updatedAtColKey, objKey, realmGet$updatedAt.getTime(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.updatedAtColKey, objKey, false);
            }
        }
    }

    public static com.ninespartans.xmanager.model.Device createDetachedCopy(com.ninespartans.xmanager.model.Device realmObject, int currentDepth, int maxDepth, Map<RealmModel, CacheData<RealmModel>> cache) {
        if (currentDepth > maxDepth || realmObject == null) {
            return null;
        }
        CacheData<RealmModel> cachedObject = cache.get(realmObject);
        com.ninespartans.xmanager.model.Device unmanagedObject;
        if (cachedObject == null) {
            unmanagedObject = new com.ninespartans.xmanager.model.Device();
            cache.put(realmObject, new RealmObjectProxy.CacheData<RealmModel>(currentDepth, unmanagedObject));
        } else {
            // Reuse cached object or recreate it because it was encountered at a lower depth.
            if (currentDepth >= cachedObject.minDepth) {
                return (com.ninespartans.xmanager.model.Device) cachedObject.object;
            }
            unmanagedObject = (com.ninespartans.xmanager.model.Device) cachedObject.object;
            cachedObject.minDepth = currentDepth;
        }
        com_ninespartans_xmanager_model_DeviceRealmProxyInterface unmanagedCopy = (com_ninespartans_xmanager_model_DeviceRealmProxyInterface) unmanagedObject;
        com_ninespartans_xmanager_model_DeviceRealmProxyInterface realmSource = (com_ninespartans_xmanager_model_DeviceRealmProxyInterface) realmObject;
        Realm objectRealm = (Realm) ((RealmObjectProxy) realmObject).realmGet$proxyState().getRealm$realm();
        unmanagedCopy.realmSet$_id(realmSource.realmGet$_id());
        unmanagedCopy.realmSet$name(realmSource.realmGet$name());
        unmanagedCopy.realmSet$version(realmSource.realmGet$version());
        unmanagedCopy.realmSet$type(realmSource.realmGet$type());
        unmanagedCopy.realmSet$mac(realmSource.realmGet$mac());
        unmanagedCopy.realmSet$ble_mac(realmSource.realmGet$ble_mac());
        unmanagedCopy.realmSet$wifi_mac(realmSource.realmGet$wifi_mac());

        // Deep copy of program
        unmanagedCopy.realmSet$program(com_ninespartans_xmanager_model_DeviceProgramRealmProxy.createDetachedCopy(realmSource.realmGet$program(), currentDepth + 1, maxDepth, cache));

        // Deep copy of user
        unmanagedCopy.realmSet$user(com_ninespartans_xmanager_model_UserRealmProxy.createDetachedCopy(realmSource.realmGet$user(), currentDepth + 1, maxDepth, cache));
        unmanagedCopy.realmSet$createdAt(realmSource.realmGet$createdAt());
        unmanagedCopy.realmSet$updatedAt(realmSource.realmGet$updatedAt());

        return unmanagedObject;
    }

    static com.ninespartans.xmanager.model.Device update(Realm realm, DeviceColumnInfo columnInfo, com.ninespartans.xmanager.model.Device realmObject, com.ninespartans.xmanager.model.Device newObject, Map<RealmModel, RealmObjectProxy> cache, Set<ImportFlag> flags) {
        com_ninespartans_xmanager_model_DeviceRealmProxyInterface realmObjectTarget = (com_ninespartans_xmanager_model_DeviceRealmProxyInterface) realmObject;
        com_ninespartans_xmanager_model_DeviceRealmProxyInterface realmObjectSource = (com_ninespartans_xmanager_model_DeviceRealmProxyInterface) newObject;
        Table table = realm.getTable(com.ninespartans.xmanager.model.Device.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);
        builder.addObjectId(columnInfo._idColKey, realmObjectSource.realmGet$_id());
        builder.addString(columnInfo.nameColKey, realmObjectSource.realmGet$name());
        builder.addString(columnInfo.versionColKey, realmObjectSource.realmGet$version());
        builder.addString(columnInfo.typeColKey, realmObjectSource.realmGet$type());
        builder.addString(columnInfo.macColKey, realmObjectSource.realmGet$mac());
        builder.addString(columnInfo.ble_macColKey, realmObjectSource.realmGet$ble_mac());
        builder.addString(columnInfo.wifi_macColKey, realmObjectSource.realmGet$wifi_mac());

        com.ninespartans.xmanager.model.DeviceProgram programObj = realmObjectSource.realmGet$program();
        if (programObj == null) {
            builder.addNull(columnInfo.programColKey);
        } else {
            com.ninespartans.xmanager.model.DeviceProgram cacheprogram = (com.ninespartans.xmanager.model.DeviceProgram) cache.get(programObj);
            if (cacheprogram != null) {
                builder.addObject(columnInfo.programColKey, cacheprogram);
            } else {
                builder.addObject(columnInfo.programColKey, com_ninespartans_xmanager_model_DeviceProgramRealmProxy.copyOrUpdate(realm, (com_ninespartans_xmanager_model_DeviceProgramRealmProxy.DeviceProgramColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.DeviceProgram.class), programObj, true, cache, flags));
            }
        }

        com.ninespartans.xmanager.model.User userObj = realmObjectSource.realmGet$user();
        if (userObj == null) {
            builder.addNull(columnInfo.userColKey);
        } else {
            com.ninespartans.xmanager.model.User cacheuser = (com.ninespartans.xmanager.model.User) cache.get(userObj);
            if (cacheuser != null) {
                builder.addObject(columnInfo.userColKey, cacheuser);
            } else {
                builder.addObject(columnInfo.userColKey, com_ninespartans_xmanager_model_UserRealmProxy.copyOrUpdate(realm, (com_ninespartans_xmanager_model_UserRealmProxy.UserColumnInfo) realm.getSchema().getColumnInfo(com.ninespartans.xmanager.model.User.class), userObj, true, cache, flags));
            }
        }
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
        StringBuilder stringBuilder = new StringBuilder("Device = proxy[");
        stringBuilder.append("{_id:");
        stringBuilder.append(realmGet$_id());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{name:");
        stringBuilder.append(realmGet$name());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{version:");
        stringBuilder.append(realmGet$version());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{type:");
        stringBuilder.append(realmGet$type());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{mac:");
        stringBuilder.append(realmGet$mac());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{ble_mac:");
        stringBuilder.append(realmGet$ble_mac());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{wifi_mac:");
        stringBuilder.append(realmGet$wifi_mac());
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{program:");
        stringBuilder.append(realmGet$program() != null ? "DeviceProgram" : "null");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{user:");
        stringBuilder.append(realmGet$user() != null ? "User" : "null");
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
        com_ninespartans_xmanager_model_DeviceRealmProxy aDevice = (com_ninespartans_xmanager_model_DeviceRealmProxy)o;

        BaseRealm realm = proxyState.getRealm$realm();
        BaseRealm otherRealm = aDevice.proxyState.getRealm$realm();
        String path = realm.getPath();
        String otherPath = otherRealm.getPath();
        if (path != null ? !path.equals(otherPath) : otherPath != null) return false;
        if (realm.isFrozen() != otherRealm.isFrozen()) return false;
        if (!realm.sharedRealm.getVersionID().equals(otherRealm.sharedRealm.getVersionID())) {
            return false;
        }

        String tableName = proxyState.getRow$realm().getTable().getName();
        String otherTableName = aDevice.proxyState.getRow$realm().getTable().getName();
        if (tableName != null ? !tableName.equals(otherTableName) : otherTableName != null) return false;

        if (proxyState.getRow$realm().getObjectKey() != aDevice.proxyState.getRow$realm().getObjectKey()) return false;

        return true;
    }
}
