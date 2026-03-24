import pandas as pd
import sqlite3

conn = sqlite3.connect("data/processed/jobs.db")

def test_row_count():
    df = pd.read_sql("SELECT COUNT(*) as cnt FROM jobs", conn)
    assert df["cnt"][0] > 100, "Too few jobs collected"
    print("✅ Test 1: Row count good")

def test_required_columns():
    df = pd.read_sql("SELECT * FROM jobs LIMIT 1", conn)
    required = ["title", "company", "country", 
                "salary_avg", "skills_mentioned", "is_remote"]
    for col in required:
        assert col in df.columns, f"Missing: {col}"
    print("✅ Test 2: All columns present")

def test_skills_extracted():
    df = pd.read_sql(
        "SELECT COUNT(*) as cnt FROM jobs WHERE skills_mentioned != ''", 
        conn)
    assert df["cnt"][0] > 50, "Too few jobs with skills extracted"
    print("✅ Test 3: Skills extracted successfully")

def test_market_insights_view():
    df = pd.read_sql("SELECT * FROM market_insights", conn)
    assert "market_signal" in df.columns
    print("✅ Test 4: Market insights view working")

test_row_count()
test_required_columns()
test_skills_extracted()
test_market_insights_view()
print("\n🎉 All tests passed!")